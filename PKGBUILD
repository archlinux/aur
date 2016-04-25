# Maintainer: Daniel Maslowski <info@orangecms.org>

pkgname=slacker
pkgver=0.9.0
pkgrel=1
pkgdesc="Simple Slack client for the CLI"
arch=('any')
url="https://github.com/TidalLabs/Slacker"
license=('GPL3')
depends=('php56' 'php56-ncurses')
optdepends=()
makedepends=('git' 'make')
conflicts=()
install=
backup=('etc/php56/conf.d/openssl.ini')
source=(
  "https://github.com/TidalLabs/Slacker/archive/v$pkgver.tar.gz"
  'slacker.patch'
)
sha512sums=(
  '8bcd008111770211286191c03e1eef143b60d97f273210a772eb79e5bc638262d79da225bca7adbd45548b53dd076ad7b62b8ad4aea2e56de788383145636bdb'
  '5a661f0e727b2efb1c1fbbe640d387206fa65dbceceff27a0b0a12d68d64f91378c3f974c2a7c65cea821ee4648627f06c18f820e7fddb28d8fc94aedc5b6e5a'
)

prepare() {
  cd ${srcdir}/Slacker-$pkgver
  patch slacker.php ${srcdir}/slacker.patch 
}

package() {
  cd ${srcdir}/Slacker-$pkgver
  install -Dm 755 slacker.php "${pkgdir}/usr/bin/slacker"
  echo 'extension=openssl.so' > openssl.ini
  install -Dm 644 openssl.ini "$pkgdir/etc/php56/conf.d/openssl.ini"
}
