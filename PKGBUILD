# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=neovim-presence-git
pkgver=r46.774994a
pkgrel=2
pkgdesc="Discord Rich Presence for Neovim"
arch=('any')
url="https://github.com/andweeb/presence.nvim"
license=('unknown')
groups=('neovim-plugins')
depends=('neovim>=0.5.0')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  find autoload lua plugin \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
