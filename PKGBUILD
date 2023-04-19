# Maintainer: Bao Trinh <qubidt at gmail dot com>

pkgname=rc-sircmpwn
pkgver=r113.d85438e
pkgrel=1
pkgdesc="an experimental shell for Unix inspired by Plan 9's rc"
arch=('x86_64')
url="https://git.sr.ht/~sircmpwn/rc"
license=('GPL3')
depends=()
makedepends=('git' 'hare' 'hare-madeline' 'scdoc')
provides=("rc")
conflicts=("rc")
_commit='d85438e264bb156a467f4decfedbd1213ee56bec'
source=("${pkgname}::git+${url}#commit=${_commit}")
md5sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${pkgname}"
	make docs
	make rc
}

check() {
	cd "${pkgname}"
	hare test
}

package() {
	cd "${pkgname}"
	make DESTDIR="${pkgdir}/" PREFIX=/usr install
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "COPYING"
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "README.md"
}
