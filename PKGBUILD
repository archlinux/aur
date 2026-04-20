# Maintainer: TheCrabeuh <clement.dallasenn@outlook.fr>

pkgname=fren-git
pkgver=r12.145ab60
pkgrel=1
pkgdesc="A TUI file manager that lets you open files and directories with any app"
arch=('x86_64')
url="https://github.com/TheCrabevariable/fren"
license=('MIT')
depends=('glibc' 'xdg-utils' 'chafa')
makedepends=('git' 'rust')
optdepends=(
  "noto-fonts-emoji: for emoji icons"
  "ttf-jetbrains-mono-nerd: for Nerd icon mode"
)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/fren"
  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/fren"
  cargo build --release --locked
}

package() {
  cd "$srcdir/fren"

  install -Dm755 target/release/fren \
    "$pkgdir/usr/bin/fren"

  install -Dm644 assets/fren.desktop \
    "$pkgdir/usr/share/applications/fren.desktop"

  install -Dm644 assets/fren.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/fren.png"
}
