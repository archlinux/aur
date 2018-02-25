# Maintainer: Hong Shick Pak <hong@hspak.com>

pkgname=onepaq
pkgver=v0.9.0
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
sha256sums=('b5f452b37d8d56904141792240e888d6842831ed02181dae5e2e1958fc3c56ac'
            'b2cb6b881d53f3e2e7230dab6ec94ec09f4b46b60cb97bfa9f8cccb1cba05b0d')

build() {
  cd "${pkgname}-$(echo $pkgver | cut -c 2-)"

  go build -ldflags="-X main.DevBuild=False"
}

package() {
  cd "${pkgname}-$(echo $pkgver | cut -c 2-)"

  # binary
  install -D -m 0755 "${pkgname}-$(echo $pkgver | cut -c 2-)" "${pkgdir}/usr/bin/onepaq"

  # systemd file
  install -D -m 0644 "${srcdir}/onepaq.service" "${pkgdir}/usr/lib/systemd/system/onepaq.service"

  # license
  install -D -m 0644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ft=sh syn=sh et
