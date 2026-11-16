#
# PKGBUILD for ancient-git
#
# Maintainer: Uffe Jakobsen -=_<_ uffe -=_<_ _at_ _>_=- uffe_dot_org _>_=-
#

pkgname=ancient-git
pkgver=v2.3.0.r6.g1491a35
pkgrel=1
epoch=
pkgdesc="Modern decompressor for old data (archive) compression formats"
arch=('i686' 'x86_64')
_gitname=ancient
_pkgname=${pkgname}
#_pkg_name_ver=${_pkgname}-${pkgver}
_pkg_name_ver=${_pkgname}
url="https://github.com/temisu/ancient"
license=('BSD-2-Clause')
#groups=()
#makedepends=('')
depends=("glibc" "libgcc" "libstdc++")
checkdepends=()
#optdepends=()
#provides=('')
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=
#changelog=

source=("${_pkgname}::git+https://github.com/temisu/ancient.git")

sha256sums=("SKIP")

#noextract=()


#
#
#

pkgver()
{
  cd "${srcdir}/${_pkg_name_ver}"

  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare()
{
  cd "${srcdir}/${_pkg_name_ver}"

  ./autogen.sh;
  ./configure --prefix="/usr";
}

build()
{
  cd "${srcdir}/${_pkg_name_ver}"

  #make -f Makefile.unix;
  make -f Makefile;
}

check()
{
  cd "${srcdir}/${_pkg_name_ver}"

  #obj/test
  gcc testing/test.cpp -o test .libs/libancient.a -l stdc++
  ./test

}

package()
{
  cd "${srcdir}/${_pkg_name_ver}"

  make PREFIX=/usr DESTDIR="${pkgdir}" install

  #install -m 644 -D "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/"
  install -m 644 -D "LICENSE.bzip2" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.bzip2"

  #install -m 644 -D "COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
  #install -m 644 -D "COPYING.GPL" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING.GPL"

}

# EOF
