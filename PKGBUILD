# Maintainer: Salamandar <felix@piedallu.me>

pkgname=nanosvg_fltk
pkgver=2022.12.22
pkgrel=1
pkgdesc='Simple stupid SVG parser (FLTK fork for PrusaSlicer)'
arch=('i686' 'x86_64' 'armv6' 'armv6h' 'armv7h')
url='https://github.com/fltk/nanosvg'
license=('AGPL3')
makedepends=(
    'cmake'
)

source=(
    "git+${url}"
)
sha256sums=(
    'SKIP'
)
conflicts=('nanosvg')

build() {
    cmake_args=(
        -DCMAKE_INSTALL_PREFIX=/usr
        -DCMAKE_INSTALL_LIBDIR=lib
    )
    cmake -B build -S nanosvg -G Ninja "${cmake_args[@]}"
    cmake --build build
}

package () {
    DESTDIR="$pkgdir" cmake --install build

    # # Patch desktop files
    # for i in PrusaGcodeviewer PrusaSlicer; do
    #     sed -i '/^Name=/ s/$/ (Git version)/' "${pkgdir}/usr/share/applications/$i.desktop"
    # done
}
