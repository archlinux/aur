# Maintainer: aligator <aligator at-symbol suncraft-server dot de>

_pkgname='befstools'
pkgname=${_pkgname}-git
pkgver=0.2.r14.g2e8c6dc
pkgver() {
  cd  ${_pkgname}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
provides=(${_pkgname})
pkgrel=1
pkgdesc="utilities to hande BeOS file systems in Linux "
arch=("x86_64" "i686")
url="https://github.com/luisbg/befstools"
license=("GPL3")
depends=("systemd-libs")
makedepends=("make" "autoconf")
source=("git+https://github.com/luisbg/${_pkgname}.git")
sha512sums=('SKIP')

build() {
	cd ${srcdir}/${_pkgname}
	autoreconf -f -i
	./configure
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR=${pkgdir} install 
	mkdir ${pkgdir}/usr/bin/ ${pkgdir}/usr/share/
	mv ${pkgdir}/usr/local/sbin/* ${pkgdir}/usr/bin/
	mv ${pkgdir}/usr/local/share/* ${pkgdir}/usr/share/
	rm -R ${pkgdir}/usr/local
}

