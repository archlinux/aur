# Maintainer: Håvard Pettersson <mail@haavard.me>
# Contributor: Andrew Stubbs <andrew.stubbs@gmail.com>

pkgname=etcher-cli
pkgver=1.4.1
pkgrel=1
pkgdesc='Burn images to SD cards & USB drives, safe & easy'
arch=(x86_64)
url='http://www.etcher.io/'
license=(apache)
makedepends=(npm)
source=("https://github.com/resin-io/etcher/archive/v$pkgver.tar.gz")
sha256sums=('41bb2e325b45e5adc00e32bd2c0b1e9bbd0f8dfe328e8237fc7d4175fde2bd60')

build() {
  cd etcher-$pkgver
  make electron-develop
  make dist/Etcher-cli-$pkgver-linux-x64 RELEASE_TYPE=production
}

package() {
  cd etcher-$pkgver/dist

  mkdir -p "$pkgdir"/{opt,usr/bin}
  cp -a Etcher-cli-$pkgver-linux-x64 "$pkgdir"/opt/$pkgname
  ln -s /opt/$pkgname/etcher "$pkgdir"/usr/bin/etcher
}

# vim:set ts=2 sw=2 et:
