# Maintainer:  Joost Bremmer <toost.b@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Kwpolska <kwpolska@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Laszlo Papp <djszapi @ gmail at com>

pkgname=neovim-nerdtree
pkgver=6.5.0
pkgrel=2
pkgdesc='Tree explorer plugin for navigating the filesystem'
arch=('any')
url='https://github.com/preservim/nerdtree'
license=('custom:WTFPL')
depends=('neovim')
groups=('neovim-plugins')
install=nvim-doc.install
source=("$pkgname-$pkgver.zip::https://github.com/preservim/nerdtree/archive/${pkgver}.zip"
        'COPYING')
sha256sums=('f6a4e1481a97b1a8b71531950c99d843d55af2b80ec01a72fa7da6de906446c3'
            '7637386b5f81e8a719ca336233149005e5fa28b5e6054ea7b67de49355b0ad40')


package() {
  local RUNTIME="${pkgdir}/usr/share/nvim/runtime"


  cd "${srcdir}/${pkgname#neovim-}-${pkgver}"

  install -d \
    "$RUNTIME/"{"autoload/nerdtree","doc","lib/nerdtree","nerdtree_plugin","plugin","syntax"}

  find "autoload" -type f -iname "*.vim" -exec install -Dvm644 "{}" \
    "$RUNTIME/{}" \;

  install -Dvm644 "doc/NERDTree.txt" "${RUNTIME}/doc/"

  install -Dvm644 nerdtree_plugin/{exec_menuitem,fs_menu}.vim \
    "${RUNTIME}/nerdtree_plugin/"

  find "lib/nerdtree" -type f -iname "*.vim" -exec install -vm644 "{}" \
    "${RUNTIME}/{}" \;

  install -Dvm644 plugin/NERD_tree.vim "${RUNTIME}/plugin/"
  install -Dvm644 syntax/nerdtree.vim "${RUNTIME}/syntax/"
  install -Dvm644 "LICENCE" "${pkgdir}/usr/share/licenses/$pkgname/LICENCE"
}

# vim:set ts=2 sw=2 et:
