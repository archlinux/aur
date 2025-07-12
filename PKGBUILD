# Maintainer: Doridian <archlinux at doridian dot net>

pkgname=superfan
pkgver=1.0.0
pkgrel=1
pkgdesc='Supermicro fan control for X9 and X10 series motherboards'
arch=('x86_64')
url='https://github.com/Doridian/superfan'
license=('MIT')
makedepends=('go')
depends=('lm_sensors')
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    'superfan.service'
)
sha256sums=(
  'ecaa850098ee05452555e5dfc6e29d1f635fedce363aeaddb6837df520041837'
  '14f9f6d88b69872c8852dd661b9886e0e53b062f0d68e4bfe5b31c24e1507219'
)

prepare() {
  cd "${srcdir}"
  tar -xf "${pkgname}-${pkgver}.tar.gz"
  cd "${pkgname}-${pkgver}"
  go mod download
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  go build -trimpath -o superfan ./cmd/superfan
}

package() {
  cd "${srcdir}"

  install -Dm755 "${pkgname}-${pkgver}/superfan" "${pkgdir}/usr/bin/superfan"
  install -Dm644 "${srcdir}/superfan.service" "${pkgdir}/usr/lib/systemd/system/superfan.service"
}

# vim:set ts=2 sw=2 et:
