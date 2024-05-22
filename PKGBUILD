# Maintainer: dario loi <dario13 loi at gmail dot com>
pkgname=staplegl-git
pkgver=0.10.0
pkgrel=1
pkgdesc="Header-only C++20 OpenGL wrapper"
arch=('any')
url="https://github.com/dario-loi/staplegl"
license=('MIT')
source=("git+https://github.com/dario-loi/staplegl.git#tag=v${pkgver}")
md5sums=('SKIP')
makedepends=('git')
optdepends=('glfw: to compile the examples'
            'tbb: for the multithreading in the batches example'
            'cmake: to compile the examples'
            'doxygen: to generate the documentation locally')

pkgver() {
    cd "${srcdir}/staplegl"
    git describe --tags | sed 's/^v//;s/-/./g'
}

package() {
    cd "${srcdir}/staplegl"

    # Create the destination directories
    install -d "${pkgdir}/usr/include/staplegl"
    install -d "${pkgdir}/usr/include/staplegl/modules"

    # Copy the header files
    cp -r "include/"* "${pkgdir}/usr/include/staplegl/"

    # Copy the LICENSE file
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/staplegl/LICENSE"
}
