# Maintainer: kevku <kevku@gmx.com>
pkgname=kodi-addon-inputstream-adaptive-git
pkgver=r29.47038df
pkgrel=1
pkgdesc="InputStream client for adaptive streams for Kodi 17+"
arch=('x86_64' 'i686')
url="https://github.com/peak3d/inputstream.adaptive"
license=('GPL2')
depends=('kodi-platform')
makedepends=('kodi-dev')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
# kodi 17
source=('kodi-addon-inputstream-adaptive-git::git+https://github.com/peak3d/inputstream.adaptive.git#branch=1.0.8_k17')
# kodi 17 2.0.6
# source=('kodi-addon-inputstream-adaptive-git::git+https://github.com/peak3d/inputstream.adaptive.git#branch=k17_2')
# kodi 18
# source=('kodi-addon-inputstream-adaptive-git::git+https://github.com/peak3d/inputstream.adaptive.git')
md5sums=('SKIP')

pkgver() {
        cd "$srcdir/$pkgname"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
        cd "$srcdir/$pkgname/wvdecrypter"
        cmake \
            -DCMAKE_INSTALL_PREFIX=/usr
        make

        cd "$srcdir/$pkgname"
        cmake \
            -DCMAKE_INSTALL_PREFIX=/usr
        make
}

package() {
        cd "$srcdir/$pkgname"
        make DESTDIR="$pkgdir/" install
        install -Dm644 wvdecrypter/libssd_wv.so "$pkgdir/usr/lib/kodi/addons/inputstream.adaptive/lib/libssd_wv.so"
}
