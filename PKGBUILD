# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-cutlass-git
pkgver=r38.7afd649
pkgrel=1
pkgdesc="Vim plugin that adds a 'cut' operation separate from 'delete'"
arch=('any')
url="https://github.com/svermeulen/vim-cutlass"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
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
  find autoload doc plugin \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm 644 License.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
