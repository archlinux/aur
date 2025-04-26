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
sha256sums=('SKIP')

build() {
  cd "${pkgname}-${pkgver}"
  npm install --omit=dev
}

package() {
  cd "${pkgname}-${pkgver}"

  # Create a simple launcher
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/telecord" <<EOF
#!/bin/bash
node /usr/lib/telecord/bin/telecord.mjs "\$@"
EOF

  # Install the actual project files
  mkdir -p "$pkgdir/usr/lib/$pkgname"
  cp -r bin lib assets package.json package-lock.json node_modules "$pkgdir/usr/lib/$pkgname/"

  # Install README
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

