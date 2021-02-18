# Maintainer: lmartinez-mirror
pkgname=vim-pkgbuild-git
_pkgname=${pkgname%-git}
pkgver=r13.5fc4106
pkgrel=1
pkgdesc="Vim plugin to edit PKGBUILD files"
arch=('any')
url="https://github.com/m-pilia/vim-pkgbuild"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
optdepends=('vim-ale' 'pacman-contrib' 'shellcheck')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  find ale_linters autoload doc ftdetect ftplugin indent plugin scripts \
    syntax template -type f -exec install -Dm644 '{}' \
    "$pkgdir/usr/share/vim/vimfiles/{}" \;
}
