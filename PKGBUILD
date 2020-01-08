# Maintainer: Maciej Suminski <orson@orson.net.pl>
# Contributors: milk
# based on qjackctl-svn by robertfoster

pkgname=qjackctl-git
pkgver=r1253.7b3c624
pkgrel=1
pkgdesc="A Qt front-end for the JACK low-latency audio server"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('jack' 'hicolor-icon-theme' 'qt5-x11extras')
url="https://qjackctl.sourceforge.io/"
makedepends=('git' 'qt5-tools')
provides=('qjackctl')
conflicts=('qjackctl' 'qjackctl-svn')
# sf.net is the original repository, but has connection problems
#source=("${pkgname}"'::git+http://git.code.sf.net/p/qjackctl/code')
source=("${pkgname}"'::git+https://github.com/rncbc/qjackctl.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list HEAD --count --first-parent)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname}"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=8 sts=2 sw=2 et:
