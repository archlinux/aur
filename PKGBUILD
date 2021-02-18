# Maintainer: lmartinez
pkgname=vim-hexokinase-git
_pkgname=${pkgname%-git}
pkgver=r112.9f7f4ba
pkgrel=2
pkgdesc="(Neo)Vim plugin for asynchronously displaying hex colors"
arch=('any')
url="https://github.com/rrethy/vim-hexokinase"
license=('unknown')
groups=('vim-plugins')
depends=('hexokinase' 'vim-plugin-runtime')
optdepends=('neovim>=0.3.2: virtual text and sign_column support'
            'vim: sign_column support (compiled with +signs)')
makedepends=('git')
provides=("$_pkgname")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  find autoload doc lua plugin -type f -exec install -Dm644 '{}' \
    "$pkgdir/usr/share/vim/vimfiles/{}" \;
}

