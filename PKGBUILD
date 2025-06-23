# Maintainer: Pixel

pkgname=walrs-git
pkgver=1.1.7
pkgrel=1
pkgdesc="Generate colorscheme from image"
arch=('x86_64' 'aarch64')
url="https://pixelll.is-a.dev/tools/walrs"
license=('GPL3')
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'git' 'make')
source=("git+https://github.com/Pixel2175/walrs.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/walrs"
  cargo build --release
}

package() {
  cd "$srcdir/walrs"
  install -Dm755 target/release/walrs "$pkgdir/usr/bin/walrs"
  install -Dm644 walrs.1 "$pkgdir/usr/share/man/man1/walrs.1"

  install -d "$pkgdir/usr/share/walrs/templates"
  install -d "$pkgdir/usr/share/walrs/scripts"
  install -d "$pkgdir/usr/share/walrs/colorschemes"

  cp -r templates/* "$pkgdir/usr/share/walrs/templates/"
  cp -r scripts/* "$pkgdir/usr/share/walrs/scripts/"
  cp -r colorschemes/* "$pkgdir/usr/share/walrs/colorschemes/"

  bash ./autocomplete.sh
}

