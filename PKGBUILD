# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Franklyn Tackitt <franklyn@tackitt.net>
# Contributor: Christian Höppner <chris@mkaito.com>

pkgname=drone-cli
pkgver=1.0.8
pkgrel=1
pkgdesc='Drone CLI'
arch=('any')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='http://docs.drone.io/cli-installation/'
license=('Apache')
makedepends=('go')
source=("https://github.com/drone/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('843285866ac43fac9a0c287782199e3763bd8c51f7e203067dcc5969c8eed2fe')

build() {
  export GOPATH="${srcdir}"
  mkdir -p src/github.com/drone
  mv "${pkgname}-${pkgver}" src/github.com/drone/drone-cli
  go build \
    -gcflags "all=-trimpath=${PWD}/src" \
    -asmflags "all=-trimpath=${PWD}/src" \
    -ldflags "-X main.version=${pkgver}" \
    -o drone github.com/drone/drone-cli/drone
}

package() {
  # binary
  install -D -m755 drone "${pkgdir}/usr/bin/drone"
  # doc files
  install -D -m644 src/github.com/drone/drone-cli/README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
