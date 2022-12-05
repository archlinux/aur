# Maintainer: Jobol <jobol@nonadev.net>
pkgname=tr7
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="A Tiny R7RS-small Scheme interpreter intended as an extension language for other applications."
arch=(x86_64 i686)
url="https://gitlab.com/jobol/tr7"
license=('custom:0BSD')
groups=()
depends=(glibc)
makedepends=(gcc make)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://gitlab.com/jobol/tr7/-/archive/v1.0.0/tr7-v1.0.0.tar.gz")
md5sums=("197e64f306b586cf651fa351ad816778")
noextract=()
validpgpkeys=()

build() {
  cd ${srcdir}/${pkgname}-v${pkgver}
  make EFLAGS="-Wl,-z,relro,-z,now -fPIE" OFLAGS="-O2 -g -DTR7_LIB_PATH=\"/usr/lib/tr7\"" tr7i libtr7.a tr7.html
  strip tr7i
}

check() {
  cd ${srcdir}/${pkgname}-v${pkgver}
  make test
}

package() {
  mkdir -p ${pkgdir}/usr/lib/tr7
  mkdir -p ${pkgdir}/usr/bin/
  mkdir -p ${pkgdir}/usr/include/
  mkdir -p ${pkgdir}/usr/share/licenses/tr7
  cd ${srcdir}/${pkgname}-v${pkgver}
  cp -v COPYING ${pkgdir}/usr/share/licenses/tr7/
  cp -v tr7i ${pkgdir}/usr/bin/
  cp -v -r tr7libs/* ${pkgdir}/usr/lib/tr7/
  cp -v libtr7.a ${pkgdir}/usr/lib/
  cp -v tr7.h ${pkgdir}/usr/include/
}

