# Maintainer: taotieren <admin@taotieren.com>

pkgbase=libosal
pkgname=libosal
_tagname=0.2.0-rev0
pkgver="${_tagname//-/_}"
pkgrel=1
pkgdesc="Write os-independent code for easy portability between different systems and architectures."
arch=($CARCH)
url="https://github.com/robert-burger/libosal"
license=('LGPL-3.0-only')
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(glibc)
makedepends=(
    git
    pkgconf
)
checkdepends=()
optdepends=()
source=("${pkgname}::git+${url}.git#tag=${_tagname}")
sha256sums=('2b2fd55fc6af16caaa0290b295fa919e74abe032cd92346b1314bba34ee9cf92')
options=()

build() {
    cd "${srcdir}/${pkgname}/"
    sed "s|PACKAGE_VERSION|${_tagname}|" configure.ac.in > configure.ac
    autoreconf -is
    ./configure --prefix=/usr
    make
}

# check() {
    # cd "${srcdir}/${pkgname}"
   #  make check CFLAGS="-Wall -Wextra"
    # make check CFLAGS="-Wall -Wextra -Werror -m64  -Wall -Wshadow \
    # -Wpointer-arith -Wstrict-prototypes -Wmissing-prototypes"
# }

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR=${pkgdir} install
}
