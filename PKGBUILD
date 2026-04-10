# Maintainer: Mistan Khomdram <mistankhomdram@gmail.com>
pkgname=lazychad
pkgver=1.0.0
pkgrel=2
pkgdesc="An intelligent, highly-aesthetic Neovim wrapper built on NvChad"
arch=('any')
url="https://github.com/MistanKh/LazyChad"
license=('MIT')
depends=('neovim' 'git' 'ripgrep' 'bash')
provides=('lazychad')
conflicts=('lazychad')
install=lazychad.install
source=("git+https://github.com/MistanKh/LazyChad.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/LazyChad"
  git describe --long --tags --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | grep . ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$srcdir/LazyChad"

  # Install the wrapper binary
  install -Dm755 bin/lazychad "$pkgdir/usr/bin/lazychad"

  # Install the Neovim configuration files
  install -dm755 "$pkgdir/usr/share/lazychad"
  cp -a init.lua lua "$pkgdir/usr/share/lazychad/"
  
  # Install documentation and license
  install -Dm644 README.md "$pkgdir/usr/share/doc/lazychad/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
