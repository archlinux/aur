# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-caw-git
pkgver=1.1.1.r21.g4263742
pkgrel=1
pkgdesc="A vim comment plugin supporting operator/non-operator mappings, 300+ filetypes"
arch=('any')
url="https://github.com/tyru/caw.vim"
license=('unknown')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
optdepends=('vim-repeat')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver()  {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
  cd "$pkgname"
  find after autoload doc lua macros plugin \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
