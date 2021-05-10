# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-cpp-modern-git
pkgver=r96.1a0d31f
pkgrel=1
pkgdesc="Extended Vim syntax highlighting for C/C++"
arch=('any')
url="https://github.com/bfrg/vim-cpp-modern"
license=('custom:vim')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=("${pkgname%-git}" 'vim-cpp-enhanced-highlight')
conflicts=("${pkgname%-git}" 'vim-cpp-enhanced-highlight')
source=("$pkgname::git+$url"
        'LICENSE')
sha256sums=('SKIP'
            'a9a3217805de6a090c34170e53dca6bfd6222e40e0cbed1116d09a94ba42dd22')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  find after \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm 644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
