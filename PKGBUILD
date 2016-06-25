# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Past maintainer: Ryon Sherman <ryon.sherman@gmail.com>
# NOTE: This package was previously called truecrack-svn.
# the project has moved from google code to github.

_pkgname="truecrack"

pkgname="${_pkgname}-git"
pkgver=r64.50eca69
pkgrel=3
pkgdesc="TrueCrack is a brute-force password cracker for TrueCrypt volume files."
conflicts=('truecrack-svn')

provides=(${_pkgname})

arch=('i686' 'x86_64')
license=('GPL3')
url="https://code.google.com/p/${_pkgname}"

makedepends=('gcc')
optdepends=('cuda: GPU Support')

source=("git+https://github.com/lvaccaro/truecrack.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  (
     printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  #( set -o pipefail
  #  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
  #  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  #)
  )
}

build() {
    cd ${srcdir}/${_pkgname}
    ./configure --prefix=/usr --enable-cpu
    make
}

package() {
  cd ${srcdir}/${_pkgname}

  install -d ${pkgdir}/usr/share/licenses/${_pkgname}
  install -Dm0644 COPYING ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE

  make DESTDIR=${pkgdir} install
}
