# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=php-yaml-new
_extname=yaml
pkgver=2.0.0
pkgrel=1
pkgdesc="Support for YAML 1.1 serialization using the LibYAML library, beta version (PHP7 compatible)."
arch=("i686" "x86_64")
url="http://bd808.com/pecl-file_formats-yaml/"
license=('MIT')
depends=('php' 'libyaml')
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz")
sha256sums=('ef13ff56c184290c025a522bf9ae2e1b3ecc8543c3a5161dd02adec90897a221')
backup=("etc/php/conf.d/$_extname.ini")
replaces=('php-yaml')
provides=('php-yaml')
conflicts=('php-yaml')

check() {
  cd "$srcdir"/$_extname-$pkgver
  make test
}

build() {
  cd "$srcdir"/$_extname-$pkgver
  phpize
  ./configure
  make
}

package() {
  cd "$srcdir"/$_extname-$pkgver
  install -m0755 -d "$pkgdir"/etc/php/conf.d/
  install -m0644 -D "LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  echo "extension=$_extname.so" > "$pkgdir"/etc/php/conf.d/$_extname.ini
  chmod 0644 "$pkgdir"/etc/php/conf.d/$_extname.ini
  install -m0755 -D ".libs/$_extname.so" "$pkgdir"$(php-config --extension-dir)/$_extname.so
}
