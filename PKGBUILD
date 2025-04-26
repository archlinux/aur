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

source=("https://github.com/vinayydv3695/telecord/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP') # (later add real sha256sum)

build() {
  cd "${pkgname}-${pkgver}"
  npm install --omit=dev
}

package() {
  cd "${pkgname}-${pkgver}"

  # Install the executable script
  install -Dm755 bin/telecord.js "$pkgdir/usr/bin/telecord"

  # Install lib/ and other files into /usr/lib/telecord
  mkdir -p "$pkgdir/usr/lib/$pkgname"
  cp -r lib "$pkgdir/usr/lib/$pkgname/"
  cp -r assets "$pkgdir/usr/lib/$pkgname/"
  cp package.json "$pkgdir/usr/lib/$pkgname/"
  cp package-lock.json "$pkgdir/usr/lib/$pkgname/"

  # Install node_modules (needed for runtime!)
  cp -r node_modules "$pkgdir/usr/lib/$pkgname/"

  # Install README
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

