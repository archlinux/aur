# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Franklyn Tackitt <franklyn@tackitt.net>
# Contributor: Christian Höppner <chris@mkaito.com>

pkgname=drone-cli
pkgver=1.0.7
pkgrel=1
pkgdesc='Drone CLI'
arch=('any')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='http://docs.drone.io/cli-installation/'
license=('Apache')
makedepends=('go')
source=("https://github.com/drone/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('8c2266dbe6a37d715287105fc0c741f4c5aa8e85b9389e7a4a85889f91dbe7c6')

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
