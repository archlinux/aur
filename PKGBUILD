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
sha256sums=('SKIP')  # Replace with actual sha256sum later for better security

build() {
  cd "${pkgname}-${pkgver}"
  npm install --omit=dev
}

package() {
  cd "${pkgname}-${pkgver}"

  # install the app and production dependencies into /usr/lib/telecord
  npm install --production --prefix "$pkgdir/usr/lib/$pkgname"

  # install the CLI executable
  install -Dm755 \
    "$pkgdir/usr/lib/$pkgname/bin/telecord.mjs" \
    "$pkgdir/usr/bin/telecord"

  # install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

