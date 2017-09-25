# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Franklyn Tackitt <franklyn@tackitt.net>
# Contributor: Christian Höppner <chris@mkaito.com>

pkgname=drone-cli
pkgver=0.8.0
pkgrel=1
pkgdesc='Drone CLI'
arch=('any')
url='http://docs.drone.io/cli-installation/'
license=('Apache')
makedepends=('go')
source=("https://github.com/drone/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('474604de68034e7a29548b70c97cdaec6e403a157b0e86911dc7b507feaca823')

build() {
  export GOPATH="${srcdir}/${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
  mkdir -p vendor/github.com/drone/drone-cli
  ln -fsT "${srcdir}/${pkgname}-${pkgver}/drone/main.go" \
    main.go
  ln -fsT "${srcdir}/${pkgname}-${pkgver}/drone" \
    vendor/github.com/drone/drone-cli/drone
  ln -fsT vendor src
  go build -ldflags "-X main.version=${pkgver}" -o drone-cli
}

package() {
  cd "${pkgname}-${pkgver}"
  # binary
  install -D -m755 drone-cli "${pkgdir}/usr/bin/drone"
  # doc files
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
