# $Id$
# Maintainer: Étienne Deparis <etienne@depar.is>
# Maintainer: James Rayner <james@archlinux.org>
# Maintainer: Alexander Fehr <pizzapunk gmail com>
# Contributor: Sebastian Sareyko <public@nooms.de>
# -git version: Berseker <berseker86@gmail.com>

pkgname=nitrogen-git
_gitname=nitrogen
pkgver=r250.2109c85
pkgrel=1
pkgdesc="Background browser and setter for X windows - git version"
arch=('i686' 'x86_64')
url="http://projects.l3ib.org/nitrogen/"
license=('GPL')
makedepends=('git')
depends=('gtkmm' 'hicolor-icon-theme' 'librsvg')
conflicts=('nitrogen')
replaces=('nitrogen')

source=("${_gitname}::git+https://github.com/l3ib/nitrogen.git"
        'nitrogen.desktop')
md5sums=('SKIP'
         'a4b70efdc49a17b5a5632d6c2deb8566')


install='nitrogen-git.install'

options=(!emptydirs)

pkgver() {
  cd "$srcdir/${_gitname}/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "$srcdir/${_gitname}/"
  autoreconf -fi
  CXXFLAGS='-std=c++11 -g -O2' ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${_gitname}"
  make DESTDIR="$pkgdir/" install
  install -D -m644 "${srcdir}/nitrogen.desktop" "${pkgdir}/usr/share/applications/nitrogen.desktop"
}
