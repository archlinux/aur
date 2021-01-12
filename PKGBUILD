# Maintainer: Francisco Lopes <francisco+interception@nosubstance.me>
pkgname=interception-uswitch
pkgver=0.1.0
pkgrel=1
pkgdesc='uswitch: an Interception Tools tool to redirect stdin to a muxer if logged user matches'
arch=('x86_64')
license=('MIT')
url='https://gitlab.com/interception/linux/plugins/uswitch'
depends=('interception-tools' 'glibc')
makedepends=('boost' 'cmake' 'gcc')
source=("$pkgname.tar.gz::https://gitlab.com/interception/linux/plugins/uswitch/repository/archive.tar.gz?ref=v${pkgver}")
sha256sums=('5176239cef3fb536ca58070231866bbdd3515acb47e91343f122dcb22c92d008')

build() {
    cd ${srcdir}/uswitch-v${pkgver}-*
    cmake -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    cd ${srcdir}/uswitch-v${pkgver}-*/build

    make DESTDIR="$pkgdir/" install
}
