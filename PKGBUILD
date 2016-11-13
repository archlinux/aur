# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
_pkgname=ctrlp.vim
pkgname=vim-ctrlp-git
pkgver=1.79.699.88b61e7
pkgrel=1
pkgdesc='Full path fuzzy file, buffer, mru, tag, ... finder'
arch=('any') 
url='https://github.com/ctrlpvim/ctrlp.vim'
license=('custom:vim')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
provides=('vim-ctrlp')
conflicts=('vim-ctrlp')
install="vimdoc.install"
source=("git+https://github.com/ctrlpvim/ctrlp.vim"
        "vimdoc.install")
sha512sums=('SKIP'
            '37cb1bc1ba45d4626b6b274d39bacaa752679be31a7c16086aed71af9a071a911100748cc17df83808e95ff7bb57941b0b2246d485197a8e908b349466579c47')

pkgver() {
  cd "${_pkgname}"
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -d \
    "${pkgdir}/usr/share/vim/vimfiles/"{autoload,doc,plugin}
  cp -dr autoload/* "${pkgdir}/usr/share/vim/vimfiles/autoload"
  cp -dr doc/* "${pkgdir}/usr/share/vim/vimfiles/doc/"
  install -m644 plugin/ctrlp.vim "${pkgdir}/usr/share/vim/vimfiles/plugin/"
}

# vim:set et sw=2 ts=2 tw=79:
