# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
pkgname=neovim-neoline-git
pkgver=r93.f743568
pkgrel=1
pkgdesc="Status line for Neovim focused on beauty and performance"
arch=('any')
url="https://github.com/adelarsq/neoline.vim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  find lua plugin \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
  install -Dvm 644 License "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
