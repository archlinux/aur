## Contributor: Star Brilliant
pkgname=stdoutisatty
pkgver=8.04881d0
pkgrel=1
pkgdesc='A tiny utility to trick the program to believe that its stdout is an interactive tty'
arch=('i686' 'x86_64')
url="https://github.com/lilydjwg/${pkgname}"
license=('BSD')
depends=('glibc')
makedepends=('cmake')
source=('git+https://github.com/lilydjwg/stdoutisatty.git')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	mkdir "${srcdir}/${pkgname}/build"
	cd "${srcdir}/${pkgname}/build"
	cmake -D CMAKE_INSTALL_PREFIX=/usr ..
	make 
}

package() {
	cd "${srcdir}/${pkgname}/build"
	make install DESTDIR="${pkgdir}"
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
	install -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m644 ../README.rst "${pkgdir}/usr/share/doc/${pkgname}"
}
