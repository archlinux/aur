# Maintainer: lmartinez-mirror
pkgname=vim-cmake4vim-git
pkgver=r109.b48f1b4
pkgrel=1
pkgdesc="Vim plugin for CMake projects"
arch=('any')
url="https://github.com/ilyachur/cmake4vim"
license=('GPL3')
groups=('vim-plugins')
depends=('cmake')
optdepends=('vim-dispatch'
            'vim-fzf'
            'vim-ctrlp')
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
  find after autoload doc plugin \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
