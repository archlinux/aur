_pkgname="pipeline-c"
pkgname="${_pkgname}-git"
pkgver=45.d7181e2
pkgrel=1
pkgdesc='The `pipeline` shell command'
arch=('x86_64')
url="https://github.com/codekitchen/pipeline"
license=('MIT')
depends=('ncurses' 'readline')
provides=("${_pkgname}")
conflicts=('pipeline-git')
epoch=1
source=("${_pkgname}::git+https://github.com/codekitchen/pipeline.git")

pkgver() {
	cd "${_pkgname}"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${_pkgname}"
	autoreconf -fi
	./configure
}

build() {
	cd "${_pkgname}"
	make
}

check() {
	: #Do nothing
}

package() {
	cd "${_pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}/" install
	install -m644 -D "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -m644 -D "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README"
}

sha256sums=('SKIP')
