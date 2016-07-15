# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=php-wikidiff2-git
pkgver=r78.26738b5
pkgrel=1
pkgdesc="A PHP module that provides the external diff engine for MediaWiki"
arch=('i686' 'x86_64')
license=('GPL')
url='https://www.mediawiki.org/wiki/Extension:Wikidiff2'
depends=('php' 'libthai')
makedepends=('git')
source=("git+https://gerrit.wikimedia.org/r/p/mediawiki/php/wikidiff2.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/wikidiff2"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/wikidiff2"

  phpize
  ./configure
  make
}

package() {
  cd "${srcdir}/wikidiff2"

  make install INSTALL_ROOT="${pkgdir}"
}
