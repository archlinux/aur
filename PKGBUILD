# Maintainer: Letu Ren <fantasquex at gmail dot com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname='rp++'
_name='rp'
pkgver=2.1
pkgrel=1
pkgdesc='A fast C++ ROP gadget finder for PE/ELF/Mach-O x86/x64/ARM binaries.'
arch=('x86_64')
url='https://github.com/0vercl0k/rp'
license=('MIT')
depends=(gcc-libs)
makedepends=('cmake' 'ninja')
source=(${_name}-${pkgver}.tar.gz::"https://github.com/0vercl0k/rp/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0c02ce21f546145fc2bcc4647818fd411c8f55ed8232e28efdee8dc04f150074')

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
    install -Dm755 "build/rp-lin" "${pkgdir}/usr/bin/rp"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

