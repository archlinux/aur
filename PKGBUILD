# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Andreas Wagner <AndreasBWagner@pointfree.net>

pkgname=vim-vimwiki-dev-git
pkgver=2.2.r13.g9be9688
pkgrel=1
pkgdesc='Personal Wiki for Vim; dev branch'
arch=('any')
url='https://github.com/vimwiki/vimwiki'
license=('MIT')
groups=('vim-plugins')
depends=('vim')
makedepends=('git')
conflicts=('vim-vimwiki')
provides=('vim-vimwiki')
install=vimdoc.install
source=('git+https://github.com/vimwiki/vimwiki.git#branch=dev' license.txt)
sha256sums=('SKIP'
            '0870512ee7459a1caa7476a9df38585de4b309bc0ec90eaf5e8dc053af0eff53')

pkgver() {
	cd vimwiki
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd vimwiki
  install -d ${pkgdir}/usr/share/vim/vimfiles/autoload/vimwiki
  install -m644 ${srcdir}/vimwiki/autoload/vimwiki/* \
    ${pkgdir}/usr/share/vim/vimfiles/autoload/vimwiki/
  install -d ${pkgdir}/usr/share/vim/vimfiles/{ftplugin,plugin,syntax}
  for x in {ftplugin,plugin,syntax}; do
    install -m644 ${srcdir}/vimwiki/$x/* \
      ${pkgdir}/usr/share/vim/vimfiles/$x/
  done
  install -Dm644 ${srcdir}/license.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
  install -d ${pkgdir}/usr/share/vim/vimfiles/doc
  install -m644 ${srcdir}/vimwiki/doc/vimwiki.txt \
    ${pkgdir}/usr/share/vim/vimfiles/doc/
}
