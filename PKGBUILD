# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Markus Opitz <mastero23 at gmail dot com>

_gitname=x2goclient
pkgname=${_gitname}-git
pkgver=4.0.4.0.r25.g1c60cad
pkgrel=1
pkgdesc="x2go qt4 client"
arch=('i686' 'x86_64')
url="http://www.x2go.org/"
license=('GPL')
depends=('qt4' 'libldap' 'libcups' 'nxproxy' 'libssh' 'libxpm' 'hicolor-icon-theme' 'xdg-utils')
conflicts=('x2goclient')
provides=('x2goclient')
install=${pkgname}.install
source=("git://code.x2go.org/${_gitname}.git")
sha256sums=('SKIP')

prepare(){
  cd "${srcdir}/${_gitname}"

  sed -i "s:-o root -g root ::" Makefile
}

pkgver(){
  cd "${srcdir}/${_gitname}"

  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build(){
  cd "${srcdir}/${_gitname}"

  make
}

package(){
  cd "${srcdir}/${_gitname}"

  make PREFIX=/usr DESTDIR="${pkgdir}" install
}
