# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=php-yaml-beta
_extname=yaml
pkgver=2.0.0RC8
pkgrel=1
pkgdesc="Support for YAML 1.1 serialization using the LibYAML library, beta version (PHP7 compatible)."
arch=("i686" "x86_64")
url="http://bd808.com/pecl-file_formats-yaml/"
license=('MIT')
depends=('php' 'libyaml')
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz")
sha256sums=('44cab15d57b2fb8fa916ff9291059a34b0c3fa99298c2b08a5082f334613753a')
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
