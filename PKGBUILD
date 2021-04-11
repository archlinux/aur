# Maintainer: lmartinez-mirror
pkgname=vim-vimade-git
pkgver=r227.9b92543
pkgrel=2
pkgdesc="An eye-catching plugin that fades inactive buffers"
arch=('any')
url="https://github.com/tadaa/vimade"
license=('unknown')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
optdepends=('tree-sitter: experimental support for fading buffers')
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
  find autoload doc lib lua plugin \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
