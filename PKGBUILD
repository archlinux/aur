# Maintainer: Matteo De Carlo <matteo dot dek at gmail dot com>

pkgname=pipecontrol
_pkgname=PipeControl
pkgver=0.3.1
pkgrel=1
pkgdesc="Pipewire control GUI program in Qt (Kirigami2)"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/portaloffreedom/${_pkgname}"
license=('GPL3')
makedepends=('cmake' 'extra-cmake-modules' 'qt6-tools')
depends=('pipewire>=1.4.1' 'kirigami2' 'kcoreaddons' 'ki18n')
source=("$_pkgname-$pkgver.tar.gz::https://codeberg.org/portaloffreedom/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('4ad93ef90898883e20cdd5660ee0d241745a5100d22dcef3f7112ecd7c0d9ddf')

build() {
    cd "${srcdir}/${pkgname}"
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_INSTALL_SYSCONFDIR=/etc \
          -DCMAKE_INSTALL_LIBEXECDIR="lib/${pkgname}" \
	  -DCMAKE_BUILD_TYPE=Release \
          .

    make all
}

package() {
    cd "${srcdir}/${pkgname}"
    DESTDIR="${pkgdir}" make install
}

