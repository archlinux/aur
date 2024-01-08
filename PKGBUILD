# Contributor: Asuka Minato
pkgname=eigenmath-git
pkgver=r2768.cc92936
pkgrel=1
pkgdesc="Symbolic math app"
arch=('any')
url="https://github.com/georgeweigt/eigenmath"
license=('BSD')
provides=('eigenmath')
conflicts=('eigenmath')
depends=(glibc)
makedepends=('git')
source=("git+https://github.com/georgeweigt/eigenmath.git"
	"https://georgeweigt.github.io/manual/eigenmath.pdf")
md5sums=('SKIP'
         '458a68601d9253535592a3a11141038a')
pkgver() {
	cd eigenmath
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd eigenmath
	make
}
check() {
	cd eigenmath
	printf "exit\n" >>test/selftest1
	printf "exit\n" >>test/selftest2
	./eigenmath test/selftest1
	./eigenmath test/selftest2
}
package() {
	pushd eigenmath
	install -vDm755 eigenmath -t "${pkgdir}/usr/bin/"
	install -vDm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -vd "$pkgdir"/usr/share/doc/"$pkgname"/
	cp -av ./doc/* "${pkgdir}/usr/share/doc/${pkgname}/"
	popd
	install -vDm644 eigenmath.pdf -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
