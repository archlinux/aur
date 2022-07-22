# Maintainer: Zhang Li Hui <raynei@protonmail.com>

pkgname=c3c-git
_pkgname=c3c
pkgver=r727.036859c
pkgrel=1
pkgdesc="C3 is an evolution of C enabling the same paradigms and retaining the same syntax as far as possible."
arch=(x86_64)
url="https://github.com/c3lang/c3c.git"
source=("git+https://github.com/c3lang/c3c.git")
license=('LGPL3' 'MIT')
makedepends=(git cmake 'llvm>=12')
provides=(c3c)
conflicts=(c3c)
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}"
    mkdir -p build
    cd build
    cmake ..
    cmake --build .
}

package() {
	cd "${_pkgname}"

	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/lib/${_pkgname}"

	cp "${srcdir}/${_pkgname}/build/c3c" "${pkgdir}/usr/lib/${_pkgname}/c3c"
	cp -r "${srcdir}/${_pkgname}/lib" "${pkgdir}/usr/lib/${_pkgname}/lib"
	ln -s "/usr/lib/${_pkgname}/c3c" "${pkgdir}/usr/bin/c3c"

	install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm644 "${srcdir}/${_pkgname}/LICENSE_STDLIB" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE_STDLIB"
}
