# Maintainer: Matteo De Carlo <matteo dot dek at gmail dot com>

pkgname=pipecontrol
_pkgname=PipeControl
pkgver=0.2.8
pkgrel=1
pkgdesc="Pipewire control GUI program in Qt (Kirigami2)"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/portaloffreedom/${_pkgname}"
license=('GPL3')
makedepends=('cmake' 'extra-cmake-modules' 'qt5-tools')
depends=('pipewire>=0.3.38' 'kirigami2' 'kcoreaddons' 'ki18n')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/portaloffreedom/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('0aac55b9c8a29d7c175267f6f4cd4f7f149906be5a038623341eae098f6cc474')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_INSTALL_SYSCONFDIR=/etc \
          -DCMAKE_INSTALL_LIBEXECDIR="lib/${pkgname}" \
	  -DCMAKE_BUILD_TYPE=Release \
          .

    make all
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" make install
}

