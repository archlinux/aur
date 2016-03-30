# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Johannes Dewender < arch at JonnyJD dot net >

pkgname=vim-vimwiki
pkgver=2.2.1
pkgrel=1
pkgdesc='A personal wiki for Vim'
arch=('any')
url='https://github.com/vimwiki/vimwiki'
license=('MIT')
groups=('vim-plugins')
depends=('vim' 'python2')
install=vimdoc.install
source=("https://github.com/vimwiki/vimwiki/archive/v${pkgver}.tar.gz")
sha256sums=('be7bbb57482d05b5ee300a944dc3fce01c9c266d1b7509c079e3f667ad924c32')

prepare() {
  # Extract licence from vim's help
  grep '^[0-9]*. License' "${pkgname#vim-}-${pkgver}/doc/vimwiki.txt" -A 1000 > LICENCE
}

package () {
  cd "${pkgname#vim-}-${pkgver}"

  install -d $pkgdir/usr/share/vim/vimfiles/autoload/vimwiki
  install -Dm644 autoload/vimwiki/* \
    ${pkgdir}/usr/share/vim/vimfiles/autoload/vimwiki/

  install -d $pkgdir/usr/share/vim/vimfiles/{doc,ftplugin,plugin,syntax}
  install -Dm644 doc/vimwiki.txt $pkgdir/usr/share/vim/vimfiles/doc/
  for x in {ftplugin,plugin,syntax}; do
    install -Dm644 $x/* $pkgdir/usr/share/vim/vimfiles/$x/
  done
  install -Dm644 ../LICENCE $pkgdir/usr/share/licenses/$pkgname/LICENCE
}
