# $Id$

pkgname=vim-mediawiki
pkgver=20110919
pkgrel=2
pkgdesc='Vim support for MediaWiki markup used on Wikipedia'
url="http://www.vim.org/scripts/script.php?script_id=1787"
license=('CCPL:by-sa')
arch=('any')
depends=('vim')
makedepends=('ed')
source=("Wikipedia.tar.gz::http://www.vim.org/scripts/download_script.php?src_id=16886")
sha256sums=('9079c52960e00f8cf095157ea5342a881f1d91fe891276bfb48cafa7b3689fb7')

prepare() {
  cd 'Wikipedia'

  # kill trailing whitespace
  # ed -s ftdetect/mediawiki.vim <<< $',s/\ *$//g\nw'

  # kill stuff that should be in an ftplugin
  ed -s ftdetect/mediawiki.vim <<< $'5,$d\nw'
}

package() {
  cd 'Wikipedia'

  install -Dm644 ftdetect/mediawiki.vim "$pkgdir/usr/share/vim/vimfiles/ftdetect/mediawiki.vim"
  install -Dm644 syntax/mediawiki.vim "$pkgdir/usr/share/vim/vimfiles/syntax/mediawiki.vim"
}
