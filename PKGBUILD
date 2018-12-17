# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=slit-git
pkgver=1.2.0.r10.g88bec40
pkgrel=1
pkgdesc='A modern PAGER for viewing logs, get more than most in less time'
arch=(x86_64)
url='https://github.com/tigrawap/slit'
license=(MIT)
makedepends=(go dep)
conflicts=(slit)
provides=(slit)
source=("${pkgname}::git+https://github.com/tigrawap/slit.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${pkgname}"

	install -m755 -d "${srcdir}/go/src/github.com/tigrawap/"
	cp -a "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/tigrawap/slit"
}

build() {
	cd "${srcdir}/go/src/github.com/tigrawap/slit"

	export GOROOT="/usr/lib/go" GOPATH="${srcdir}/go"
	make
}

package() {
	cd "${srcdir}/go/src/github.com/tigrawap/slit"

	install -m755 -D bin/slit "${pkgdir}"/usr/bin/slit
	install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/slit/LICENSE
}
