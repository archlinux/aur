# Maintainer: Hong Shick Pak <hong@hspak.com>

pkgname=onepaq
pkgver=0.10.0
pkgrel=1
pkgdesc="A cross platform 1password read-only client"
arch=('x86_64')
url="http://github.com/hspak/onepaq"
license=('MIT')
depends=()
makedepends=('git' 'go')
provides=("$pkgname")
conflicts=("$pkgname")
install=onepaq.install
source=("https://github.com/hspak/$pkgname/archive/$pkgver.tar.gz"
        'onepaq.service')
sha256sums=('fc6026cec6c52354ee7132668b8a13c47f9f45c7d1637779a574176ada0f3e0a'
            'b2cb6b881d53f3e2e7230dab6ec94ec09f4b46b60cb97bfa9f8cccb1cba05b0d')

build() {
  cd "${pkgname}-${pkgver}"

  go build -ldflags="-X main.DevBuild=False"
}

package() {
  cd "${pkgname}-${pkgver}"

  # binary
  install -D -m 0755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/onepaq"

  # systemd file
  install -D -m 0644 "${srcdir}/onepaq.service" "${pkgdir}/usr/lib/systemd/system/onepaq.service"

  # license
  install -D -m 0644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ft=sh syn=sh et
