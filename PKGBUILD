# Maintainer: Cedric Girard <girard.cedric@gmail.com>
# Contributor: kevku <kevku@gmx.com>
pkgname=kodi-addon-inputstream-adaptive
pkgver=1.0.6
pkgrel=2
pkgdesc="InputStream client for adaptive streams for Kodi 17+"
arch=('x86_64' 'i686')
url="https://github.com/liberty-developer/inputstream.adaptive"
license=('GPL2')
depends=('kodi-platform=20160516.c8188d8')
conflicts=("${pkgname%-git}")
source=("https://github.com/peak3d/inputstream.adaptive/archive/v${pkgver}.tar.gz")
md5sums=('3694af673829f35a9fbafd4cd2649abe')


build() {
        cd "$srcdir/inputstream.adaptive-${pkgver}"
        cmake \
            -DCMAKE_INSTALL_PREFIX=/usr
        make
}

package() {
        cd "$srcdir/inputstream.adaptive-${pkgver}"
        make DESTDIR="$pkgdir/" install
        sed -i 's|special://home/cdm|/usr/lib/kodi/addons/inputstream.adaptive/lib|g' "$pkgdir/usr/share/kodi/addons/inputstream.adaptive/resources/settings.xml"
}
