# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=amqp-qtools-git
pkgver=0.5.0.6f42dfd
pkgrel=2
pkgdesc="Command-line tools for sending and receiving AMQP 1.0 messages "
arch=(any)
url="https://github.com/ssorj/qtools"
license=('APACHE')
depends=('python3' 'qpid-proton')
provides=("amqp-qtools")
conflicts=('amqp-qtools')
makedepends=('git')
source=("qtools::git+https://github.com/ssorj/qtools.git")
sha256sums=('SKIP')

pkgver() {
  cd "qtools"
  echo "$(cat VERSION.txt | sed 's/-SNAPSHOT//')-$(git rev-parse --short HEAD)" | sed 's/-/./g'
}

build() {
    cd "qtools"
    make VIRTUALENV_ENABLED=0 PREFIX=/usr build
}

package() {
    cd "qtools"
    make VIRTUALENV_ENABLED=0 DESTDIR="${pkgdir}" PREFIX=/usr install
}
