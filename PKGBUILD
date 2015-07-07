# Maintainer: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
#
# This package is based on the `vim-netrw` package.

pkgname=vim-mark
pkgver=2.8.5
_pkgver=22582
pkgrel=1
pkgdesc='Highlight several words in different colors simultaneously.'
arch=(any)
url='http://www.vim.org/scripts/script.php?script_id=2666'
license=(custom:vim)
depends=(vim)
groups=(vim-plugins)
install=vimdoc.install
source=(
  "${pkgname}-${pkgver}.vmb.gz::http://www.vim.org/scripts/download_script.php?src_id=${_pkgver}"
  license.txt
)
sha256sums=('604b95e176eb3f78daa6d136deb27b1ae66d1120a094201056bc677e3f1e07b7'
            '62743e7d4354d94ef0957dd8aa43983b9244eb3cd820075b18f10b9d37d31c2d')

package() {
  # UseVimball will fail if the given directory does not exist. Create it.
  install -d "${pkgdir}/usr/share/vim/vimfiles/"
  vim -c "UseVimball ${pkgdir}/usr/share/vim/vimfiles/" -c q \
    "${srcdir}/${pkgname}-${pkgver}.vmb"
  rm "${pkgdir}/usr/share/vim/vimfiles/.VimballRecord"
  rm "${pkgdir}/usr/share/vim/vimfiles/doc/tags"

  # The vim license is not a common license, though it probably should be.
  install -D -m644 license.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}

# vim:set ts=2 sw=2 et:
