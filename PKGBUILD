# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=electron-forge
pkgver=5.2.2
pkgrel=1
pkgdesc='Tool for creating, publishing, and installing modern Electron applications'
arch=(i686 x86_64)
url=https://electronforge.io
license=(MIT)
depends=(nodejs)
makedepends=(npm gulp)
conflicts=(electron-forge-git)
source=(https://github.com/electron-userland/$pkgname/archive/v$pkgver.tar.gz)
sha512sums=('4c48e0c7c837d2dc7879c6ea7d09d31996127626e28d0c9d0a44255b936669e1db02b563df995c419853ee15d2f38dc0c27afb1d6b3ad0cedb5f0ce462cd34f6')

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
