# Maintainer: Krakn <dan.ray.beste@gmail.com>

pkgname='mojoshader-git'
_pkgname='mojoshader'
_libname="lib${_pkgname}.so"
pkgver=r1119.21e527f
pkgrel=1
pkgdesc="Fork of icculus's HLSL Bytecode -> GLSL translator with tweaks for MonoGame"
arch=(
    'i686'
    'x86_64'
)
url='https://github.com/MonoGame/mojoshader'
license=(
    'zlib'
)
makedepends=(
    'git'
)
source=(
    'git://github.com/MonoGame/mojoshader.git'
)
sha256sums=(
    'SKIP'
)

pkgver() {
	cd "${srcdir}/${_pkgname}/" || exit 1
	printf "r%s.%s"                     \
        "$(git rev-list --count HEAD)"  \
        "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}/" || exit 1
    cmake CMakeLists.txt
	make mojoshader
}

package() {
	cd "${srcdir}/${_pkgname}/" || exit 1
    install -m755 -D "${_libname}"  \
        "${pkgdir}/usr/lib/${_libname}"
    install -m644 -D "../LICENSE"   \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
