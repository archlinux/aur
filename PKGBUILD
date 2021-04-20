# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
pkgname=vim-obsession-git
pkgver=r37.82c9ac5
pkgrel=1
pkgdesc="Vim plugin for continuously updated session files"
arch=('any')
url="https://github.com/tpope/vim-obsession"
license=('custom:vim')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url"
        'LICENSE')
sha256sums=('SKIP'
            '2ccc3eb5343d26e2d73f5601a59c5c29e8c48a5e75a6bfd5cbc7e74257bb3f97')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  find doc plugin \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm 644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.markdown "$pkgdir/usr/share/doc/$pkgname/README.md"
}
