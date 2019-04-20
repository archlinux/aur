# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Johannes Dewender < arch at JonnyJD dot net >

pkgname=vim-vimwiki
pkgver=2.4.1
pkgrel=1
pkgdesc='A personal wiki for Vim'
arch=('any')
url='https://github.com/vimwiki/vimwiki'
license=('MIT')
groups=('vim-plugins')
depends=('vim' 'python2')
source=("https://github.com/vimwiki/vimwiki/archive/v${pkgver}.tar.gz")
sha256sums=('ccae0b8865bd3aea5f0834e888af294c654238f1d472390c1606f0588f01213a')

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
