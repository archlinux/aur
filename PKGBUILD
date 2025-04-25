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
sha256sums=('SKIP')  # ideally replace with the real checksum

build() {
  cd "telecord-${pkgver}"
  npm ci --omit=dev
}

package() {
  cd "telecord-${pkgver}"

  # install the app (with dependencies) into /usr/lib/telecord
  npm install --production --prefix "$pkgdir/usr/lib/$pkgname"

  # install the CLI entrypoint, which has a #!/usr/bin/env node shebang
  install -Dm755 "$pkgdir/usr/lib/$pkgname/bin/telecord.js" \
                   "$pkgdir/usr/bin/telecord"

  # docs
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

