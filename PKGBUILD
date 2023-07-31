# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi.net>

pkgname=php-luasandbox
pkgver=4.1.1
pkgrel=1
pkgdesc='PHP extension that provides a sandboxed environment to run Lua scripts in'
arch=('i686' 'x86_64')
url='https://www.mediawiki.org/wiki/LuaSandbox'
license=('MIT')
depends=('php' 'lua51')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wikimedia/mediawiki-php-luasandbox/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c1a9a212df344219401f2dfe0bf0a4d2b413b29e6f78e32ae4178efff3ae61ac')
b2sums=('47fd4d25fa24f5ae24f66fb9208c1301eebacefdf2f6d8434c3d108941782a621f0095a49990647f8a29597bb7d91f6467f17f6b78a041b5f3123cc7f70dbc22')

build() {
  cd "mediawiki-php-luasandbox-$pkgver"

  phpize
  ./configure \
    --prefix=/usr

  make
}

check() {
  cd "mediawiki-php-luasandbox-$pkgver"

  NO_INTERACTION=1 make test
}

package() {
  cd "mediawiki-php-luasandbox-$pkgver"

  make install INSTALL_ROOT="$pkgdir"

  install -dm0755 "$pkgdir/etc/php/conf.d"
  echo ';extension=luasandbox.so' > "$pkgdir/etc/php/conf.d/luasandbox.ini"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
}
