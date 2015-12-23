# Maintainer: Colin Pitrat <colin dot pitrat at gmail dot com>
pkgname=kalenji-gps-watch-reader-git
pkgver=r335.fed3fdc
pkgrel=1
pkgdesc="A tool to import data from some Kalenji running watches."
arch=('i686' 'x86_64')
url="https://github.com/ColinPitrat/kalenji-gps-watch-reader"
license=('GPL2')
depends=('libusb' 'libxml2' 'curl')
source=(git://github.com/ColinPitrat/kalenji-gps-watch-reader/
        '10-kalenji.rules')
sha256sums=('SKIP'
            '06262244b33a337ef76ada34f6f647fdd3c8528914e5c5f79ff99bdb2791990a')

pkgver() {
  cd kalenji-gps-watch-reader
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd kalenji-gps-watch-reader
  make
}

package() {
  install -Dm755 10-kalenji.rules "$pkgdir/etc/udev/rules.d/10-kalenji.rules"
  cd kalenji-gps-watch-reader
  install -Dm755 kalenji_reader "$pkgdir/usr/bin/kalenji_reader"
}
