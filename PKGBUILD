# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
pkgname=vim-context-git
pkgver=r320.e38496f
pkgrel=1
pkgdesc="Vim plugin that shows the context of the currently visible buffer contents"
arch=('any')
url="https://github.com/wellle/context.vim"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
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
  find autoload plugin \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm 644 MIT-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
