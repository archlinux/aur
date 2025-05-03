# Maintainer: Vinay <https://github.com/vinayydv3695>

pkgname=telecord
pkgver=1.0.1
pkgrel=1
pkgdesc="Export Discord chats (JSON + media) to Telegram — including interactive mode"
arch=('any')
url="https://github.com/vinayydv3695/telecord"
license=('MIT')
depends=('nodejs')
makedepends=('npm')

source=("$pkgname-$pkgver.tar.gz::https://github.com/vinayydv3695/telecord/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')  # replace with actual sha256sum later if needed

build() {
  cd "$pkgname-$pkgver"
  npm install --omit=dev
}

package() {
  cd "$pkgname-$pkgver"

  # Install the CLI entry point
  install -Dm755 bin/telecord.js "$pkgdir/usr/lib/$pkgname/bin/telecord.js"

  # Create /usr/bin/telecord symlink to the entry point
  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname/bin/telecord.js" "$pkgdir/usr/bin/telecord"

  # Install source files
  install -d "$pkgdir/usr/lib/$pkgname"
  cp -r lib assets node_modules package.json "$pkgdir/usr/lib/$pkgname/"

  # Documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

