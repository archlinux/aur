# Maintainer: Aldrin Morris D. Balitbit <aldrinbalitbit1127@gmail.com>

pkgname=extremetuxracer-svn
_pkgname="${pkgname%-svn}"
pkgver=0.8.99.r847
pkgrel=1
pkgdesc="Downhill racing game starring Tux (svn version)"
arch=(x86_64)
url="https://sourceforge.net/projects/${_pkgname}"
license=(GPL)
depends=(sfml glu freetype2)
makedepends=(subversion pkgconf csfml)
conflicts=('ppracer' 'etr' 'etracer' "${_pkgname}")
replaces=('ppracer' 'etr' 'etracer' "${_pkgname}")
source=("etr::svn://svn.code.sf.net/p/${_pkgname}/code/trunk")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}"/etr
  echo "$(cat src/version.h | grep ETR_VERSION | tail +2 | cut -d ' ' -f3 | sed "s/,0//;s/,/./g").r$(svnversion)"
}

build() {
  cd "${srcdir}"/etr
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}"/etr
  make check
}

package() {
  cd "${srcdir}"/etr
  make DESTDIR="${pkgdir}" install
}
