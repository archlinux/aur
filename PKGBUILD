# Maintainer: Cedric Girard <girard.cedric@gmail.com>
# Contributor: kevku <kevku@gmx.com>
pkgname=kodi-addon-inputstream-adaptive
pkgver=1.0.8
pkgrel=1
pkgdesc="InputStream client for adaptive streams for Kodi 17+"
arch=('x86_64' 'i686')
url="https://github.com/peak3d/inputstream.adaptive"
license=('GPL2')
makedepends=('kodi-dev')
depends=('kodi-platform=20170306.36fb493')
conflicts=("${pkgname%-git}")
source=("https://github.com/peak3d/inputstream.adaptive/archive/${pkgver}_k17.tar.gz")
md5sums=('5f0b3acfd278a8e9bfac5bb8191b05ec')


build() {
        cd "$srcdir/inputstream.adaptive-${pkgver}_k17"
        cmake \
            -DCMAKE_INSTALL_PREFIX=/usr
        make
}

package() {
        cd "$srcdir/inputstream.adaptive-${pkgver}_k17"
        make DESTDIR="$pkgdir/" install
        sed -i 's|special://home/cdm|/usr/lib/kodi/addons/inputstream.adaptive/lib|g' "$pkgdir/usr/share/kodi/addons/inputstream.adaptive/resources/settings.xml"
}
