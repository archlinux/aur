#  Maintainer: Justin Benge <justinbng36@gmail.com>
#  Contributor: Jean Lucas <jean@4ray.co>

pkgname=electron-forge
pkgver=5.2.4
pkgrel=1
pkgdesc='Tool for creating, publishing, and installing modern Electron applications'
arch=(i686 x86_64)
url=https://electronforge.io
license=(MIT)
depends=(nodejs)
makedepends=(npm gulp)
conflicts=(electron-forge-git)
source=(https://github.com/electron-userland/$pkgname/archive/v$pkgver.tar.gz)
sha512sums=('20cca6e76ac7239d088930b4b4cc100d8a2051a60d777f68826a64b11c3e662a11a7f0860a5ee9370041bdd828ec2d75c62d3c509b00dd7ea7b8c15cf72aeba2')

build() {
  cd $pkgname-$pkgver
  npm install
}

package() {
  cd $pkgname-$pkgver
  _dest="$pkgdir"/usr/lib/node_modules/$pkgname
  mkdir -p {$_dest,"$pkgdir"/usr/bin}
  cp -a . $_dest
  chmod +x $_dest/dist/$pkgname.js
  ln -s /usr/lib/node_modules/$pkgname/dist/$pkgname.js "$pkgdir"/usr/bin/electron-forge
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
