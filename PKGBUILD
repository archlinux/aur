# Maintainer: Håvard Pettersson <mail@haavard.me>
# Contributor: Andrew Stubbs <andrew.stubbs@gmail.com>

pkgname=etcher
pkgver=1.4.1
pkgrel=1
pkgdesc='Burn images to SD cards & USB drives, safe & easy'
arch=(x86_64)
url='http://www.etcher.io/'
license=(apache)
depends=(gtk2 libxtst libxss gconf nss alsa-lib)
optdepends=('libnotify: for notifications'
            'speech-dispatcher: for text-to-speech')
makedepends=(npm)
source=("https://github.com/resin-io/etcher/archive/v$pkgver.tar.gz")
sha256sums=('41bb2e325b45e5adc00e32bd2c0b1e9bbd0f8dfe328e8237fc7d4175fde2bd60')

build() {
  cd etcher-$pkgver
  make electron-develop
  make electron-installer-debian RELEASE_TYPE=production
}

package() {
  cd etcher-$pkgver/dist

  ar x etcher-electron_${pkgver}_amd64.deb data.tar.xz
  tar -xf data.tar.xz -C "$pkgdir"

  mkdir -p "$pkgdir"/usr/bin
  ln -s /opt/Etcher/etcher-electron "$pkgdir"/usr/bin/etcher-electron
}

# vim:set ts=2 sw=2 et:
