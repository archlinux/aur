# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
pkgname=neovim-nonicons-git
pkgver=r16.f136ab9
pkgrel=1
pkgdesc="Icon set for neovim plugins and settings"
arch=('any')
url="https://github.com/yamatsum/nvim-nonicons"
license=('unknown')
groups=('neovim-plugins')
depends=('neovim' 'nonicons-font')
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
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
