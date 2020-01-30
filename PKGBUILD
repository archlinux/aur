# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Franklyn Tackitt <franklyn@tackitt.net>
# Contributor: Christian Höppner <chris@mkaito.com>

pkgname=drone-cli
pkgver=1.2.1
pkgrel=1
pkgdesc='Drone CLI'
arch=('any')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='http://docs.drone.io/cli-installation/'
license=('Apache')
makedepends=('go')
source=("https://github.com/drone/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('cde58c5ad1972caf447cdd168eeda0cdaca0eb1d2808994c9c51326952bd9aff')

build() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}"
  go build \
    -gcflags "all=-trimpath=${srcdir}" \
    -asmflags "all=-trimpath=${srcdir}" \
    -ldflags "-X main.version=${pkgver}" \
    -o drone ./drone
  go clean -modcache
}

package() {
  cd "${pkgname}-${pkgver}"
  # binary
  install -D -m755 drone/drone "${pkgdir}/usr/bin/drone"
  # doc files
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
