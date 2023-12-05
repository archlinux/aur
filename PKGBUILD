# Maintainer: Raffaele Mancuso <raffaelemancuso532@gmail.com>
pkgname=sqlean-git
pkgver=0.21.8.r4.g47d3efb
pkgrel=1
pkgdesc="The ultimate set of SQLite extensions"
arch=('x86_64')
url="https://github.com/nalgeon/sqlean"
license=('MIT')
groups=()
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname}::git+https://github.com/nalgeon/sqlean")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${pkgname}"
	make prepare-dist
	make download-sqlite
	make download-external
}

build() {
	cd "${srcdir}/${pkgname}"
	make compile-linux
}

check() {
	cd "${srcdir}/${pkgname}"
}

package() {
	cd "${srcdir}/${pkgname}/dist"
	install -D -m755 *.so --target-directory="${pkgdir}/usr/lib/sqlean"
}
