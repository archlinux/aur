# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-unicode-git
pkgver=20.r143.g090e77e
pkgrel=1
pkgdesc="Vim plugin that provides a completion function for Unicode glyphs"
arch=('any')
url="https://github.com/chrisbra/unicode.vim"
license=('custom:vim')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
  cd "$pkgname"
  find autoload doc ftdetect plugin syntax \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
