# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=coinmon
pkgver=0.0.17
pkgrel=1
pkgdesc='Cryptocurrency price monitoring tool'
arch=('any')
url=https://github.com/bichenkk/coinmon
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("coinmon-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
noextract=("${source[@]%%::*}")
sha512sums=('b5feb285f61f18ec2f0e639bd834f6bc781de024a8f0533128ded8495ff71971b236b8b4788e371d49c171faa9fac1d05447e6d4fc48af0148200a67f12a912a')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr --ignore-scripts --production coinmon-$pkgver.tar.gz

  cd "$pkgdir"
  mkdir -p usr/share/licenses/coinmon
  mv usr/lib/node_modules/coinmon/LICENSE usr/share/licenses/coinmon/
  rmdir usr/etc
  rm usr/lib/node_modules/coinmon/{.,}* | true
  chmod 755 usr/bin
  find usr/lib/node_modules/coinmon/node_modules -type d -exec chmod 755 {} +
}

# vim:set ts=2 sw=2 et:
