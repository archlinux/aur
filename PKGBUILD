# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi.net>

pkgname=php-luasandbox
pkgver=4.1.0
pkgrel=1
pkgdesc='PHP extension that provides a sandboxed environment to run Lua scripts in'
arch=('i686' 'x86_64')
url='https://www.mediawiki.org/wiki/LuaSandbox'
license=('MIT')
depends=('php' 'lua51')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wikimedia/mediawiki-php-luasandbox/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('52df81fb659691f32cd6a51ae521ac5a982c30383d68e9d34338a0c3dec28e72')
b2sums=('169e023a6f4c4b9d92114d80b05c81e07e487950c27c3bc4f25dd5c0c3b5915469fb997c7ae65b132a66c5e04c1c5d008e252589ed152acb046ecbb15e1b76b1')

build() {
  cd "mediawiki-php-luasandbox-$pkgver"

  phpize
  ./configure \
    --prefix=/usr

  make
}

package() {
  cd "mediawiki-php-luasandbox-$pkgver"

  make install INSTALL_ROOT="$pkgdir"
  install -Dm0644 -t "$pkgdir/etc/php/conf.d" luasandbox.ini

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
}
