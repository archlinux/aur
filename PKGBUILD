# Maintainer: Christian Knauber <christian AT knauber DOT net>
pkgname=librethinkdbxx-git
pkgrel=1
pkgver=r152.11e19e6
pkgdesc="RethinkDB driver for C++"
arch=('i686' 'x86_64')
url="https://github.com/AtnNn/librethinkdbxx"
license=('apache2')
depends=()
makedepends=('git' 'python')
conflicts=('librethinkdbxx')
provides=('librethinkdbxx')
source=("${pkgname}"::'git+https://github.com/AtnNn/librethinkdbxx.git')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
	make INCLUDE_PYTHON_DOCS=yes 
} 

package() {
	cd "${srcdir}/${pkgname}"

	# install binaries
	make install prefix=/usr DESTDIR="$pkgdir"

	# install additional files
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "COPYRIGHT" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
}
