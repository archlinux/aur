#Maintainer: Evert Vorster <evorster@gmail.com>
pkgname=vegastrike-git
_pkgname=vegastrike
pkgver=rev.11494
pkgrel=1
pkgdesc="Vega Strike - Upon the Coldest Sea. Space flight and trading simulator with realistic distances"
arch=('any')
url="www.vega-strike.org"
license=('GPL')
depends=('expat' 'vegastrike-engine')
optdepends=()
makedepends=('git' 'cmake')
provides=('vegastrike')
conflicts=('vegastrike')
#install=$pkgname.install
#options=(!makeflags debug !strip)

source=('git+https://github.com/vegastrike/Assets-Production')
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}"/Assets-Production
  echo "rev.$(git rev-list --count HEAD)"
}

prepare(){
echo "Prepare section"
#Patches section
cd ${srcdir}/Assets-Production/
#git apply ../../19.patch
}


build(){
  cmake -DCMAKE_INSTALL_PREFIX=/usr "${srcdir}"/Assets-Production/CMakeLists.txt
}

package() {
  mkdir -p "${pkgdir}"
  make -C "${srcdir}" DESTDIR="${pkgdir}" install
}

