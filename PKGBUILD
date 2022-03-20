# Maintainer: Letu Ren <fantasquex at gmail dot com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname='rp++'
_name='rp'
pkgver=2.0.2
pkgrel=1
pkgdesc='rp++ is a fast C++ ROP gadget finder for PE/ELF/Mach-O x86/x64/ARM binaries.'
arch=('x86_64')
url='https://github.com/0vercl0k/rp'
license=('MIT')
depends=()
makedepends=('cmake' 'ninja')
source=("https://github.com/0vercl0k/rp/archive/refs/tags/v2.0.2.tar.gz")
sha256sums=("SKIP")

build() {
    cd "${_name}-${pkgver}"
    cmake -B build -S "src" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -GNinja -Wno-dev
    cmake --build build
}

package() {
    cd "${_name}-${pkgver}"
    install -Dm755 "build/rp-lin-x64" "${pkgdir}/usr/bin/rp"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

