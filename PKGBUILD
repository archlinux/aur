_pkgname="raylib-cpp"
pkgname=${_pkgname}-git
pkgver=0.1.0.r39.gd6f0f22
pkgrel=1
pkgdesc=""
arch=('x86_64')
url="https://github.com/RobLoach/raylib-cpp"
license=('MIT')
depends=('raylib')
provides=("${_pkgname}")
conflicts=()
epoch=1
source=("${_pkgname}::git+https://github.com/RobLoach/raylib-cpp.git"
	"raylib-cpp.pc")

sha256sums=('SKIP'
	'997739e84bea5facc6b502a88af0ffb79eb0eabefb122e900d47c1cd88928203')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_pkgname}"
}

build() {
	cd "${srcdir}"
	sed -ie "s/\${version}/$(pkgver)/g" raylib-cpp.pc
}

check() {
	cd "${srcdir}/${_pkgname}"
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -m644 -d "${pkgdir}/usr/include/raylib"
	cp -r "${srcdir}/${_pkgname}/include/raylib" "${pkgdir}/usr/include/"
	install -m644 -D "${srcdir}/raylib-cpp.pc" "${pkgdir}/usr/lib/pkgconfig/raylib-cpp.pc"
	install -m644 -D "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -m644 -D "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
