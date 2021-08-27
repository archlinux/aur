# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Franklyn Tackitt <franklyn@tackitt.net>
# Contributor: Christian Höppner <chris@mkaito.com>

pkgname=drone-cli
pkgver=1.3.3
pkgrel=1
pkgdesc='Drone CLI'
arch=('any')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='http://docs.drone.io/cli-installation/'
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("https://github.com/drone/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('0ecab87bc9d923e7a1e89d89289f33f7b0fc49c991793e8c1ebbfae168e20cbe')

build() {
  cd "${pkgname}-${pkgver}"
  go build \
    -buildmode=pie \
    -trimpath \
    -modcacherw \
    -ldflags "-X main.version=${pkgver} -extldflags ${LDFLAGS}" \
    -o drone ./drone
}

package() {
  cd "${pkgname}-${pkgver}"
  # binary
  install -D -m755 drone/drone "${pkgdir}/usr/bin/drone"
  # doc files
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
