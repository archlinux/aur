# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi.net>

pkgname=php-luasandbox
pkgver=4.1.2
pkgrel=1
pkgdesc='PHP extension that provides a sandboxed environment to run Lua scripts in'
arch=('i686' 'x86_64')
url='https://www.mediawiki.org/wiki/LuaSandbox'
license=('MIT')
depends=('php' 'lua51')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wikimedia/mediawiki-php-luasandbox/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f75cda3675f57c6ee38e78cf8c215963ad36bdb86128ce76aa0f6281a6967adb')
b2sums=('9e1ea045fbf1401cd12e8519b3e2f527878c39f870b7cdfe48145bcc085d2d7b2d8b74ec216f09dc534b52745f55806277aa1c2fe51d7293ec887f74ce45bb6a')

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
