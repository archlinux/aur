# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=neovim-lspconfig-git
pkgver=r1110.161ec66
pkgrel=2
pkgdesc="Quickstart configurations for the Neovim LSP client"
arch=('any')
url="https://github.com/neovim/nvim-lspconfig"
license=('Apache')
groups=('neovim-plugins')
depends=('neovim>=0.5.0')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="$pkgname.install"
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  find autoload doc lua plugin scripts \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
