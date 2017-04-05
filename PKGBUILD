# Maintainer: Dan Beste <dan.ray.beste@gmail.com>

pkgname='mojoshader-git'
_gitname='mojoshader'
_libname="lib${_gitname}.so"
pkgver=r1119.21e527f
pkgrel=1
pkgdesc="Fork of icculus's HLSL Bytecode -> GLSL translator with tweaks for MonoGame"
arch=(
    'i686'
    'x86_64'
)
url='https://github.com/MonoGame/mojoshader'
license=('zlib')
makedepends=('git')
optdepends=('mono: Occasionally required for bootstrapping')
source=('git+https://github.com/MonoGame/mojoshader.git')
sha256sums=('SKIP')

pkgver() {
	cd "${_gitname}"

	printf "r%s.%s"                     \
        "$(git rev-list --count HEAD)"  \
        "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_gitname}"

    mkdir -p build
    cd build
    cmake ..
	make mojoshader
}

package() {
	cd "${_gitname}/build"

    install -m755 -D "${_libname}" \
        "${pkgdir}/usr/lib/${_libname}"
    install -m644 -D ../LICENSE.txt \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
