# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=vim-unicode
pkgver=0.17
_src_id=20656
pkgrel=1
pkgdesc='Enable an easier use of any Unicode glyph'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=2822'
license=('custom:vim')
groups=('vim-plugins')
depends=('vim-runtime')
makedepends=('vim-runtime')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install='vimdoc.install'
source=("$pkgname-$pkgver.vmb::http://www.vim.org/scripts/download_script.php?src_id=$_src_id"
http://www.unicode.org/Public/UNIDATA/UnicodeData.txt
LICENSE
)
 
package () {
	cd "$srcdir"
	_vim_dir='/usr/share/vim/vimfiles'
  install -Dm644 UnicodeData.txt "$pkgdir"/${_vim_dir}/autoload/unicode/UnicodeData.txt
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  vim -c "UseVimball $srcdir" -c "q" $pkgname-$pkgver.vmb
  rm -f doc/tags || return 1
  tar -c ./  \
    --exclude $pkgname-$pkgver.vmb \
    --exclude .VimballRecord \
    --exclude LICENSE \
    --exclude UnicodeData.txt \
    | tar -x -C "$pkgdir"/$_vim_dir
}
sha256sums=('e1c848e0310ae039209ce73fb38e4afc41754cef16aa228465bff4e5109fb11b'
            '3f76924f0410ca8ae0e9b5c59bd1ba03196293c32616204b393300f091f52013'
            'e8281af29c79bbebc50b52f6d620196fdf3ca7326aaa8a84d77bcd1013c3a089')
