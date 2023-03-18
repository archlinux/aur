# Maintainer: TheJackiMonster <thejackimonster AT gmail DOT com>

_libname='aprilasr'
_reponame='april-asr'
pkgname="${_libname}-git"
pkgver='r116.cb135ef'
pkgrel=1
pkgdesc='A minimal offline speech-to-text library written in C'
arch=('x86_64')
url="https://abb128.github.io/april-asr"
license=('GPL3')
makedepends=('cmake' 'onnxruntime')
optdepends=('onnxruntime: dynamic linking support')
provides=("${_libname}")
conflicts=("${_libname}")
source=("git+https://github.com/abb128/${_reponame}.git")
md5sums=('SKIP')

pkgver() {
	cd "${_reponame}"
	printf "'r%s.%s'" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_reponame}"
	cmake -DCMAKE_BUILD_TYPE=Release .
	make
}

package() {
	cd "${srcdir}/${_reponame}"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "lib${_libname}_static.a" "${pkgdir}/usr/lib/lib${_libname}_static.a"
	install -Dm644 "lib${_libname}.so" "${pkgdir}/usr/lib/lib${_libname}.so"
	install -Dm755 main "${pkgdir}/usr/bin/${_libname}-main"
	install -Dm755 srt "${pkgdir}/usr/bin/${_libname}-srt"
}

