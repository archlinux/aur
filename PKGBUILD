# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Franklyn Tackitt <franklyn@tackitt.net>
# Contributor: Christian Höppner <chris@mkaito.com>

pkgname=drone-cli
pkgver=1.2.0
pkgrel=1
pkgdesc='Drone CLI'
arch=('any')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='http://docs.drone.io/cli-installation/'
license=('Apache')
makedepends=('go')
source=("https://github.com/drone/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('2f7cfb0ab99c94a2406f057ab509ed4974bf715a743979e62f542d889bb7bcc7')

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
