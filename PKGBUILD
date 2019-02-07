# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

pkgname=cuppa
pkgver=1.0.4
pkgrel=2
pkgdesc="Comprehensive Upstream Provider Polling Assistant."
arch=('i686' 'x86_64')
url="https://github.com/DataDrake/cuppa"
license=(MIT)
makedepends=('go-pie' 'make' 'git')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("https://github.com/DataDrake/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('4128f979856d2c16a07b0f5a103a1ebfb492c28931705257e2ed1918444bc26d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}"
}
