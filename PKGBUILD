# Maintainer: Super Tecno Gym <banana@grrlz.net>

pkgname=arduino-flasher-cli
pkgver=0.4.0
pkgrel=1
pkgdesc="Arduino UNO Q image flasher"
arch=('x86_64' 'aarch64')
url="https://github.com/arduino/arduino-flasher-cli"
license=('GPL-3')
makedepends=(
	'go'
	'go-task'
)
depends=('qdl-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('00bde6c4c461de91e7cd0592e4eaca1fbfadd64e3fcd10f7f448ef794efdeb3a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go-task init
  go-task build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 build/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
