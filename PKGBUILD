# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
# Contributor: Army
_pkgname=vim-latexsuite
pkgname=$_pkgname-git
pkgver=0.r817.392577f
pkgrel=1
epoch=1
pkgdesc="Provides a comprehensive set of tools to view, edit, and compile LaTeX documents within Vim. Also provides macros to speed up the creation of LaTeX documents."
arch=('any')
url="http://vim-latex.sourceforge.net"
license=('custom:vim')
groups=('vim-plugins')
depends=('vim-runtime')
makedepends=('git')
optdepends=('python2' 'texlive-bin')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=$pkgname.install
source=("$_pkgname::git+git://git.code.sf.net/p/vim-latex/vim-latex")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  find . -type f -name *.py | xargs sed -i 's/\/usr\/bin\/python/\/usr\/bin\/env python2/g'
}

package() {
  cd "$srcdir/$_pkgname"
  make PREFIX="$pkgdir/usr" VIMDIR="$pkgdir/usr/share/vim/vimfiles" install
}

# vim:set ts=2 sw=2 et:
