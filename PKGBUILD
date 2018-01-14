# Mantainer: Splith <spam at helper3000 net>
# Package version 0.3.1 commit: 42b50c105cc24dbe3db7638ab8c2d9508f50ebb6

pkgname=php-crypto
pkgver=0.3.1
pkgrel=1
pkgdesc='Crypto PHP extension'
url='https://github.com/bukka/php-crypto'
license=('PHP')
arch=('any')
depends=('php' 'openssl')
makedepends=('php' 'openssl' 'git')
source=("git+https://github.com/bukka/php-crypto.git")
backup=('etc/php/conf.d/crypto.ini')
sha256sums=('SKIP')

build() {
  cd $srcdir/php-crypto

  msg "Updating Git submodules..."
  git submodule init
  git submodule update

  msg "Running phpize..."
  phpize
  ./configure --prefix=/usr

  msg "Building extension..."
  make
}

package() {
  cd $srcdir/php-crypto
  msg "Installing files..."
  mkdir -p "$pkgdir"/{/usr/lib/php/modules,/etc/php/conf.d}
  mkdir -p "$pkgdir"/usr/share/licenses/php-crypto

  echo "extension=crypto.so" > "crypto.ini"

  install -D -m755 modules/crypto.so ${pkgdir}/usr/lib/php/modules/crypto.so
  install -D -m644 crypto.ini ${pkgdir}/etc/php/conf.d/crypto.ini
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/php-crypto/LICENSE
}

