# Maintainer: Brenden Hoffman <hbrenden@fastmail.com>

pkgname=nvim-ghost-git
_pkgname=nvim-ghost.nvim
pkgver=v0.1.1.r5.g052df0c
pkgrel=1
pkgdesc="Use your text editor to write in your browser. Everything you type in the editor will be instantly updated in the browser. This is the nvim-only plugin (git version)"
url='https://github.com/subnut/nvim-ghost.nvim'
arch=('any')
license=('MIT')
depends=('neovim')
makedepends=('git' 'wget')
source=("git+https://github.com/subnut/nvim-ghost.nvim.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/$_pkgname
  _pkgver=$(cat binary_version)
  wget -O "nvim-ghost-linux.tar.gz" \
    "https://github.com/subnut/nvim-ghost.nvim/releases/download/v0.1.1/nvim-ghost-linux.tar.gz"
  tar xvf "nvim-ghost-linux.tar.gz"
  rm -f "nvim-ghost-linux.tar.gz"
  chmod +x "nvim-ghost-binary"
  unset _pkgver
}

package() {
  cd $srcdir/$_pkgname
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -dm755 "${pkgdir}/usr/share/vim/vimfiles/"
  cp -dr --no-preserve=ownership {plugin,autoload,scripts,binary_version,binary.py,.editorconfig,.flake8,.restyled.yaml,nvim-ghost-binary} \
    "${pkgdir}/usr/share/vim/vimfiles/"
}
