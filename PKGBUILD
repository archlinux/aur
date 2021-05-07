# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-vader-git
pkgver=0.3.0.r173.g6fff477
pkgrel=1
pkgdesc="A simple vimscript test framework"
arch=('any')
url="https://github.com/junegunn/vader.vim"
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
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

# check() {
#   cd "$pkgname/test"
#   # ./run-tests.sh
# }

package() {
  cd "$pkgname"
  find autoload doc ftdetect ftplugin plugin syntax \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
