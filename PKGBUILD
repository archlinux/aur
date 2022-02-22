# Maintainer: Sematre <sematre at gmx dot de>
pkgname=cpu8051-git
pkgver=r11.284334f
pkgrel=1

pkgdesc="Intel(R) 8051 Instruction Set Simulator"
arch=('any')
url="https://github.com/wyvernSemi/cpu8051"
license=('GPL3')

makedepends=('git')

provides=("${pkgname%-git}" "lib${pkgname%-git}.so")
conflicts=("${pkgname%-git}")

source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname%-git}"

	mkdir obj
	make
}

package() {
	cd "${srcdir}/${pkgname%-git}"

	install -Dm755 "${pkgname%-git}"       -t "${pkgdir}/usr/bin"
	install -Dm755 "lib${pkgname%-git}.so" -t "${pkgdir}/usr/lib"

	install -Dm644 "README.md"      -t "${pkgdir}/usr/share/doc/${pkgname%-git}"
	install -Dm644 "doc/README.pdf"    "${pkgdir}/usr/share/doc/${pkgname%-git}/Reference Manual.pdf"
	install -Dm644 "LICENSE"        -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
