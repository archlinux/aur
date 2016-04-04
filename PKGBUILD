# Maintainer: Pablo Lezaeta <prflr 88 (arro'a) gmail puntocom>

pkgname=thor-codec
_pkg=thor
pkgver=r130.50d6802
pkgrel=1
url=https://tools.ietf.org/html/draft-fuldseth-netvc-thor
pkgdesc="The Thor video codec is a block-based hybrid video codec similar in structure to widespread standards."
license=("custom:BSD")
arch=("i686" "x86_64")

source=("${_pkg}::git+https://github.com/cisco/thor.git")
md5sums=("SKIP")

pkgver() {
  cd "${_pkg}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_pkg}"

  make DESTDIR=${pkgdir} prefix=/usr \
	localstatedir=/var sysconfdir=/etc \
	sbindir=/usr/bin bindir=/usr/bin \
	libdir=/usr/lib libexecdir=/usr/lib
}

package() {
  cd "${srcdir}/${_pkg}"

  make DESTDIR=${pkgdir} prefix=/usr \
	localstatedir=/var sysconfdir=/etc \
	sbindir=/usr/bin bindir=/usr/bin \
	libdir=/usr/lib libexecdir=/usr/lib \
	install
}
