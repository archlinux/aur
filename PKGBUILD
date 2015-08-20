# Maintainer: Jesper Jensen <delusionallogic at gmail dot com> 

_pkgname=iniparser
pkgname=${_pkgname}-git
pkgver=77
pkgrel=1
pkgdesc='A free stand-alone ini file parsing library written in portable ANSI C'
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/ndevilla/${_pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('git')
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git://github.com/ndevilla/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git rev-list --count HEAD
}

build() {
	cd "$srcdir/$_pkgname"
	make PREFIX=/usr
}

package() {
	cd "$srcdir/$_pkgname"
	install -D -m755 libiniparser.so.1 "${pkgdir}/usr/lib/libiniparser.so.1"
	ln -s "libiniparser.so.1" "${pkgdir}/usr/lib/libiniparser.so"
	install -D -m744 src/iniparser.h "${pkgdir}/usr/include/iniparser.h"
	install -D -m744 src/dictionary.h "${pkgdir}/usr/include/dictionary.h"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
