# Maintainer: Dringsim <dringsim@qq.com>

pkgname=php-excimer
pkgver=1.1.1
pkgrel=1
pkgdesc="Extension for PHP 7.1+ that provides a low-overhead interrupting timer and sampling profiler"
arch=('x86_64')
license=('Apache')
url='https://www.mediawiki.org/wiki/Excimer'
depends=('php')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wikimedia/mediawiki-php-excimer/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('508DB92D1CC8CC29EB8793B48B4255D3DA77C9F8F122A2FF1BE62255525F4DA8')

build() {
  cd "mediawiki-php-excimer-$pkgver"

  phpize
  ./configure --prefix=/usr

  make
}

package() {
  cd "mediawiki-php-excimer-$pkgver"

  make install INSTALL_ROOT="$pkgdir"

  install -dm0755 "$pkgdir/etc/php/conf.d"
  echo ';extension=excimer.so' > "$pkgdir/etc/php/conf.d/excimer.ini"
}
