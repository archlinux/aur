# Maintiner: See AUR page for present maintainer.
# Contributor: Cyker Way <cykerway at gmail dot com>
pkgname=latex-beamer-hg
pkgver=700.3dd33d75f1b8
pkgrel=1
pkgdesc='Beamer is a LaTeX class for creating slides for presentations.'
arch=('any')
url='http://bitbucket.org/rivanvx/beamer/wiki/Home'
license=('GPL')
depends=('texlive-core')
makedepends=('mercurial')
provides=("${pkgname/%-hg/}")
conflicts=("${pkgname/%-hg/}")
install="$pkgname.install"
source=("$pkgname::hg+https://bitbucket.org/rivanvx/beamer")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  #
  # In mercurial, you cannot assure that id -n is equal in two copies
  # of the same repository!!!!! If the repo is changed somehere else,
  # it will be a mess. So let's try this and hope for the best.
  # 
  printf "%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "$srcdir/$pkgname"
}

package() {
  cd "$srcdir/$pkgname"
  #
  # This goes into $TEXMFLOCAL. The local directories take
  # precendence in the search path as defined in /etc/texmf/web2c/texmf.cnf
  #
  install -d "$pkgdir"/usr/local/share/texmf/tex/latex/beamer
  cp -a  * "$pkgdir"/usr/local/share/texmf/tex/latex/beamer
}

# vim:set ts=2 sw=2 et:
