# Maintainer: Matthias Fulz <mfulz@olznet.de>
pkgbase=portgeist
pkgname=('portgeist-geistctl' 'portgeist-geistd')
pkgver=0.1.5
pkgrel=1
arch=('x86_64')
url="https://github.com/mfulz/portgeist"
license=('MIT')
source=(
  "https://github.com/mfulz/portgeist/archive/refs/tags/v${pkgver}.tar.gz"
  "geistd.service"
)

sha256sums=('aff1ab898e10ec04733deced555172ba242c5fe887c9ddfa00df251a031277c7'
            '0eefc52d1d8f175fb7d9eaa8c37af055a1e39e44f9d688b931e866c1136a6575')

prepare() {
  cd "$srcdir/portgeist-${pkgver}"
}

build() {
  cd "$srcdir/portgeist-${pkgver}"
  go build -o geistctl ./cmd/geistctl
  go build -o geistd ./cmd/geistd
}

package_portgeist-geistctl() {
  pkgdesc="CLI controller for Portgeist daemon"
  depends=('glibc')

  install -Dm755 "$srcdir/portgeist-${pkgver}/geistctl" "$pkgdir/usr/bin/geistctl"
}

package_portgeist-geistd() {
  pkgdesc="Daemon for Portgeist proxy management"
  depends=('glibc')

  install -Dm755 "$srcdir/portgeist-${pkgver}/geistd" "$pkgdir/usr/bin/geistd"
  install -Dm644 "$srcdir/geistd.service" "$pkgdir/usr/lib/systemd/system/geistd.service"
}
