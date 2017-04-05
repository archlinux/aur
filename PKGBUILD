# Maintainer: Dan Beste <dan.ray.beste@gmail.com>

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
license=('zlib')
depends=('mono')
makedepends=('git')
source=('git+https://github.com/flibitijibibo/XNAFileDialog')
sha256sums=('SKIP')

pkgver() {
	cd "${_gitname}"

    printf "r%s.%s"                     \
        "$(git rev-list --count HEAD)"  \
        "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_gitname}/native"

	make
}

package() {
	cd "${_gitname}/native"
    
    install -Dm 755 "${_libname}" \
        "${pkgdir}/usr/lib/${_libname}"
    install -Dm 644 ../LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
