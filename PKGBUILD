# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
pkgname=neovim-cursorline-git
pkgver=r15.b6ad7dd
pkgrel=1
pkgdesc="A Neovim plugin that highlights cursor words and lines"
arch=('any')
url="https://github.com/yamatsum/nvim-cursorline"
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
    -type f -exec install Dvm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
