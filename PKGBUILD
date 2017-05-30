_username=volunode
_reponame=boinc-app-api
_pkgbase=boinc-app-api
pkgname=${_pkgbase}
pkgdesc="API for communication with BOINC applcations."
pkgver=1.0
pkgrel=2
arch=('i686' 'x86_64')
url="https://github.com/$_username/${_reponame/}"
makedepends=('meson')
license=('LGPL')
options=('!staticlibs')
_ref="#tag=${pkgver}"
source=("git+https://github.com/${_username}/${_reponame}${_ref}")
sha256sums=('SKIP')

build() {
  if [ ! -d ${srcdir}/build ]; then
    cd ${srcdir}/${_reponame}
    meson --prefix=/usr --buildtype=release ${srcdir}/build
    cd ..
  fi

  cd ${srcdir}/build

  ninja
}

package() {
  cd ${srcdir}/build

  DESTDIR="${pkgdir}" ninja install
}
