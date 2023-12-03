# Maintainer: Letu Ren <fantasquex at gmail dot com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname='rp++'
_name='rp'
pkgver=2.1.3
pkgrel=1
pkgdesc='A fast C++ ROP gadget finder for PE/ELF/Mach-O x86/x64/ARM binaries.'
arch=('x86_64')
url='https://github.com/0vercl0k/rp'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cmake' 'ninja')
source=(${_name}-${pkgver}.tar.gz::"https://github.com/0vercl0k/rp/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('38a6ac4d1b97468c81b4da93d62b46d4486817b02bdb53de7f1196b4938ed2bc')

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

