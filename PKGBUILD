_pkgname="sidex"
pkgname="${_pkgname}-git"
pkgver=r30.876296e622
pkgrel=1
pkgdesc="Extract files from Steam .sim / .sid files (Old Steam games on DVD's)."
arch=(x86_64)
url='https://codeberg.org/CYBERDEV/SIDEx'
options=(!strip)
license=('GPL-3.0-or-later')
depends=('openssl' 'zlib')
makedepends=('make' 'gcc' 'gzip' 'cmake' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}"::"git+$url.git")
sha512sums=('SKIP')

build() {
	cd "${_pkgname}"
	gzip -f ${_pkgname}.1
	make
}

package() {
	cd "${_pkgname}"
	install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 ${_pkgname}.1.gz "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
