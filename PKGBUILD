# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Doug Newgard <scimmia22 at outlook dot com>

_pkgname=eruler
pkgname=$_pkgname-git
pkgver=0.1.0.r18.ef5c032
pkgrel=2
pkgdesc="On-Screen Ruler and Measurement Tools using EFL"
arch=('i686' 'x86_64')
url="https://www.enlightenment.org/"
license=('GPL')
depends=('efl')
makedepends=('git')
provides=("${_pkgname}=${pkgver}")
conflicts=("$_pkgname")
source=("git+https://git.enlightenment.org/enlightenment/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  local v_ver=$(awk -F , '/^AC_INIT/ {gsub(/[\[\] -]/, ""); print $2}' configure.ac)

  printf "$v_ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  ./autogen.sh --prefix=/usr

  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  make install DESTDIR="${pkgdir}"

  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/" "AUTHORS" "README"
}
