# Maintainer: lmartinez-mirror
pkgname=vim-stripper-git
pkgver=0.3.0.r5.g92929ad
pkgrel=1
pkgdesc="Vim plugin for stripping trailing whitespace"
arch=('any')
url="https://github.com/itspriddle/vim-stripper"
license=('custom:vim')
groups=('vim-plugin')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
  cd "$pkgname"
  find doc plugin \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dm 644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.markdown "$pkgdir/usr/share/doc/$pkgname/README.md"
}
