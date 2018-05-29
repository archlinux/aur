# Maintainer: <shlomochoina@gmail.com>
pkgname=uterm-git
_pkgname=uterm
pkgver=r96.6a8ab26
pkgrel=1
pkgdesc="A WIP terminal emulator, written in C++11 using Skia, libtsm, and GLFW "
arch=('x86_64')
url="https://github.com/kirbyfan64/uterm"
license=('MIT')
depends=('mesa' 'freetype2' 'fontconfig')
makedepends=('git' 'fbuild' 'clang') 
source=('git+https://github.com/kirbyfan64/uterm.git'
        'git+https://github.com/skaslev/gl3w.git'
		'abseil::git+https://github.com/abseil/abseil-cpp.git'
		'git+https://github.com/google/skia.git#branch=chrome/m65'
		'git+https://github.com/fmtlib/fmt.git#branch=4.x'
		'git+https://github.com/nemtrif/utfcpp.git'
		'git+https://github.com/Aetf/libtsm#branch=master'
        'git+https://github.com/greg7mdp/sparsepp')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${_pkgname}"
	git submodule init deps/{gl3w,abseil,skia,fmt,utfcpp,libtsm,sparsepp}
	git config submodule.abseil.url ../abseil
    git config submodule.gl3w.url ../gl3w
    git config submodule.skia.url ../skia
    git config submodule.fmt.url ../fmt
    git config submodule.utfcpp.url ../utfcpp
    git config submodule.libtsm.url ../libtsm
    git config submodule.sparsepp.url ../sparsepp
	git submodule update deps/{gl3w,abseil,skia,fmt,utfcpp,libtsm,sparsepp}
}
build() {
	cd "$srcdir/${_pkgname}"
	fbuild 
}

package() {
	cd "$srcdir/${_pkgname}"
	fbuild install --release --destdir="$pkgdir" --prefix=usr
}
