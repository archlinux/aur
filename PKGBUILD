# Maintainer: Piotr Rogoża <piotr dot r dot public at gmail dot com>

pkgname=vim-unicode
pkgver=0.20
_src_id=22794
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
sha256sums=('5865bc82fa6f35ce8f01868a387e0b254f0e3f68c30e0417fbd8c22f8327398a'
            '38b17e1118206489a7e0ab5d29d7932212d38838df7d3ec025ecb58e8798ec20'
            'e8281af29c79bbebc50b52f6d620196fdf3ca7326aaa8a84d77bcd1013c3a089')
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
