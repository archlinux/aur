# Maintainer: SinfulBobcat <bobcatsinful+aur@gmail.com>

pkgname=ez-tree
pkgver=1.0.3
pkgrel=1
pkgdesc="EZ Tree – Procedural Tree Generator"
arch=('x86_64')
url="https://github.com/sinfulbobcat/ez-tree"
license=('MIT')

depends=(
  'gtk3'
  'libnotify'
  'libxss'
  'nss'
)

makedepends=(
  'nodejs'
  'npm'
  'git'
)

source=(
  "git+https://github.com/sinfulbobcat/ez-tree.git#tag=v${pkgver}"
  "ez-tree.desktop"
  "ez-tree.png"
)

sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

build() {
  cd "$srcdir/ez-tree"

  npm ci
  npx electron-builder --linux dir
}

package() {
  install -d "$pkgdir/usr/lib/ez-tree"
  install -d "$pkgdir/usr/bin"

  cp -r "$srcdir/ez-tree/dist/linux-unpacked/"* "$pkgdir/usr/lib/ez-tree/"

  chmod +x "$pkgdir/usr/lib/ez-tree/ez-tree"

  ln -s /usr/lib/ez-tree/ez-tree "$pkgdir/usr/bin/ez-tree"

  # Desktop entry
  install -Dm644 "$srcdir/ez-tree.desktop" \
    "$pkgdir/usr/share/applications/ez-tree.desktop"

  # Icon
  install -Dm644 "$srcdir/ez-tree.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/ez-tree.png"
}

