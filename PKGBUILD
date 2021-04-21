# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
pkgname=vim-lightline-bufferline-git
pkgver=r89.570e732
pkgrel=1
pkgdesc="A lightweight bufferline plugin for vim-lightline"
arch=('any')
url="https://github.com/mengelbrecht/lightline-bufferline"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime' 'vim-lightline-git')
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
  find autoload lua plugin \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
