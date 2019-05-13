# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

pkgname=cuppa
pkgver=1.1.0
pkgrel=1
pkgdesc="Comprehensive Upstream Provider Polling Assistant."
arch=('i686' 'x86_64')
url="https://github.com/DataDrake/cuppa"
license=(MIT)
makedepends=('go-pie' 'make' 'git')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("https://github.com/DataDrake/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('09afd907209ec90b5a566a487ec1c77dea1545b3eb1f8b6a976e61489329f31b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}"
}
