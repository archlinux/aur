# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Johannes Dewender < arch at JonnyJD dot net >

pkgname=vim-vimwiki
pkgver=2.3
pkgrel=2
pkgdesc='A personal wiki for Vim'
arch=('any')
url='https://github.com/vimwiki/vimwiki'
license=('MIT')
groups=('vim-plugins')
depends=('vim' 'python2')
source=("https://github.com/vimwiki/vimwiki/archive/v${pkgver}.tar.gz")
sha256sums=('a6d16a564e9e489cf89aad2d5d3383f14dbd48ab8ecc38ee530ffc13f59f2a2f')

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
