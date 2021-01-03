pkgname=zvuchno
pkgver=0.0.1
pkgrel=1
pkgdesc="PulseAudio volume notification service in go. Simple and yet another."
packager="Andrew 'thekondor' Sichevoi"
arch=('x86_64')
url="https://github.com/thekondor/zvuchno"
license=('MPL')
makedepends=(
  'git'
  'go'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/thekondor/zvuchno/archive/v${pkgver}.tar.gz")
sha256sums=('6e2dae52d61db28106b799fc6694cfd22d5fdbfb55746f1d06c041336cdaab5d')

build() {
  export GOPATH="${srcdir}"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd "${srcdir}/${pkgname}-${pkgver}"
  go build -o build/${pkgname} .
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 build/${pkgname} "${pkgdir}"/usr/bin/${pkgname}
}

