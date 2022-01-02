# Maintainer: Matteo De Carlo <matteo dot dek at gmail dot com>

pkgname=pipecontrol
_pkgname=PipeControl
pkgver=0.2.0
pkgrel=1
pkgdesc="Pipewire control GUI program in Qt"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/portaloffreedom/${_pkgname}"
license=('GPL3')
makedepends=('cmake')
depends=('pipewire>=0.3.38' 'kirigami2' 'kcoreaddons')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/portaloffreedom/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('b8db11c4a5e5ca6da0416127e5dc4e5d39bf18800ef03232e51b913e6c4f8d37')

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

