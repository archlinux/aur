# Maintainer: Julian Maingot <julianmaingot@gmail.com>
# Contributor: NBonaparte <nbonaparte@protonmail.com>

# derived from vim-zig-git
_name='zig.vim'
pkgname='nvim-zig-git'
pkgver=r129.ead2193
pkgrel=1
epoch=1
pkgdesc="Neovim configuration for Zig"
arch=('any')
url='https://github.com/ziglang/zig.vim'
license=('MIT')
depends=('neovim')
optdepends=('zig')
makedepends=('git')
conflicts=('nvim-zig')
provides=('nvim-zig')
source=("git+https://github.com/ziglang/${_name}.git")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/"${_name}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  _installpath="${pkgdir}/usr/share/nvim/site/pack/plugins/start/${_name}"
  _files="autoload ftdetect indent plugin syntax compiler ftplugin README.md"
  mkdir -p "${_installpath}"
  cd "$srcdir/${_name}"
  cp -r ${_files} "${_installpath}"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
