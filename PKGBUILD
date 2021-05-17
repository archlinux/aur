# Maintainer: Jacob <jacob *at* jacobwinski *dot* com>
# Contributor: Sorin-Mihai Vârgolici <sorin-mihai@vargolici.com>
_pkgname=vcprompt
pkgname=$_pkgname-git
pkgver=20201228.g850bf44
pkgrel=1
pkgdesc="Version control information in your prompt"
arch=(x86_64)
url="https://github.com/powerman/vcprompt"
license=('GPL2')
depends=('sqlite' 'perl')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(git://github.com/powerman/${_pkgname}.git)
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _date=$(git show -s --format='%ci' | cut -d' ' -f1 | sed 's/-//g')
  _hash=$(git show -s --format='%h')
  echo "${_date}.g${_hash}"
}

build() {
  cd "${srcdir}/${_pkgname}"
  autoreconf -fi
  autoconf
  ./configure
  make
}

package() {
  cd "$srcdir/${_pkgname}"
  install -d -m0755 "${pkgdir}/usr/bin"
  install -m755 -D "${srcdir}/${_pkgname}/vcprompt" "${pkgdir}/usr/bin"
  install -m755 -D "${srcdir}/${_pkgname}/vcprompt-hgst" "${pkgdir}/usr/bin"
  install -d -m0755 "${pkgdir}/usr/share/man/man1"
  install -m644 -D "${srcdir}/${_pkgname}/vcprompt.1" "${pkgdir}/usr/share/man/man1"
}
