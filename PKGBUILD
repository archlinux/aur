# Maintainer: Zhang Li Hui <raynei@protonmail.com>

pkgname=c3c-git
_pkgname=c3c
pkgver=r726.56a6e0b
pkgrel=1
pkgdesc="C3 is an evolution of C enabling the same paradigms and retaining the same syntax as far as possible."
arch=(x86_64)
url="https://github.com/c3lang/c3c.git"
source=("https://github.com/c3lang/c3c.git")
license=('LGPL3' 'MIT')
makedepends=(git cmake 'llvm>=12')
provides=(c3c)
conflicts=(c3c)
md5sums=('a1f44ac4eeb1508cd03fa1e30ddbe260')

pkgver() {
	cd "$srcdir/$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    mkdir -p build
    cd build
    cmake ..
    cmake --build .
}

package() {
	cd "$_pkgname"
	install -Dm644 "${srcdir}/${_pkgname}/LICENSE_STDLIB" "{$pkgdir}/usr/share/licenses/$pkgname/LICENSE_STDLIB"
	install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "{$pkgdir}/usr/share/licenses/$pkgname/LICENSE_STDLIB"
	install -Dm755 "${srcdir}/${_pkgname}/build/c3c" "${pkgdir}"/usr/bin/c3c
}
