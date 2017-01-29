# Maintainer: Krakn <dan.ray.beste@gmail.com>

pkgname=xnafiledialog-git
_gitname=XNAFileDialog
_libname="lib${_gitname}.so"
pkgver=r12.a4ea6b1
pkgrel=1
pkgdesc='This is XNAFileDialog, a portable file dialog for XNA games.'
arch=(
    'i686'
    'x86_64'
)
url='https://github.com/flibitijibibo/XNAFileDialog'
license=(
    'zlib'
)
depends=(
    'mono'
)
makedepends=(
    'git'
)
source=(
    'git://github.com/flibitijibibo/XNAFileDialog'
)
sha256sums=(
    'SKIP'
)

pkgver() {
	cd "${srcdir}/${_gitname}/" || exit 1
	printf "r%s.%s"                     \
        "$(git rev-list --count HEAD)"  \
        "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_gitname}/native/" || exit 1
	make
}

package() {
	cd "${srcdir}/${_gitname}/native/" || exit 1
    install -m755 -D "${_libname}"  \
        "${pkgdir}/usr/lib/${_libname}"
    install -m644 -D "../LICENSE"   \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
