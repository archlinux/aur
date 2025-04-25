# Maintainer: Vinay <https://github.com/vinayydv3695>
pkgname=telecord
pkgver=1.0.0
pkgrel=1
pkgdesc="Export Discord chats (JSON + media) to Telegram — including interactive mode"
arch=('any')
url="https://github.com/vinayydv3695/telecord"
license=('MIT')
depends=('nodejs')
makedepends=('npm')

source=(
  "https://github.com/vinayydv3695/telecord/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('SKIP')  # Replace with real sha256sum for strict integrity

build() {
  cd "telecord-${pkgver}"
  npm install --omit=dev
}

package() {
  cd "telecord-${pkgver}"

  # install the CLI entrypoint
  install -Dm755 bin/telecord.js "$pkgdir/usr/bin/telecord"

  # install the library files
  install -d "$pkgdir/usr/lib/$pkgname/lib"
  cp -r lib/* "$pkgdir/usr/lib/$pkgname/lib/"

  # docs
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

