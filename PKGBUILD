# Maintainer: Super Tecno Gym <banana@grrlz.net>

pkgname=arduino-flasher-cli
pkgver=0.5.0
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
sha256sums=('8b9a1521b045db5b0f5b41efbb7a16fdffa8f6d382fa3e5ef46132b636246f94')

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
