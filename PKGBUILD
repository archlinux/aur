# $Id$
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>

_gitname=doctrina
pkgname=${_gitname}-git
pkgver=0.1.9.r0.g35ce7a6
pkgrel=1
pkgdesc='The library of Software Peronista'
arch=('x86_64')
license=('GPL3')
url='https://git.softwareperonista.com.ar/cdp/doctrina'
conflicts=('doctrina')
provides=('doctrina')
depends=('glib2' 'sqlite3')
makedepends=('meson' 'vala' 'git')
source=("${pkgname}::git+https://git.softwareperonista.com.ar/cdp/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname}

  arch-meson . build

  ninja -C build
}

package() {
  cd ${pkgname}

  DESTDIR="$pkgdir" ninja -C build install
}
