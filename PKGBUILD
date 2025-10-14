# Maintainer: Bink
pkgname=ktx-software-bin
pkgver=4.4.2
pkgrel=1
pkgdesc="KTX (Khronos Texture) Library and Tools"
arch=("x86_64")
url="https://github.com/KhronosGroup/KTX-Software"
license=("Apache-2.0")
depends=("zlib" "libpng" "libjpeg-turbo" "openexr")
provides=("ktx-software")
conflicts=("ktx-software" "ktx_software")
options=('!strip')
source=(
    "https://github.com/KhronosGroup/KTX-Software/releases/download/v${pkgver}/KTX-Software-${pkgver}-Linux-x86_64.tar.bz2"
)
sha256sums=('a8781bad05f9624edbf910b7f258cd0a4ba7d3e63b49ecc0a0ab440bf6a0a245')

package() {
    cd "${srcdir}/KTX-Software-${pkgver}-Linux-x86_64"

    # Binaries
    install -Dm755 bin/* -t "${pkgdir}/usr/bin"

    # Libraries
    install -Dm755 lib/*.so* -t "${pkgdir}/usr/lib"

    # CMake config files
    install -Dm644 lib/cmake/ktx/* -t "${pkgdir}/usr/lib/cmake/ktx"

    # Manpages
    if compgen -G "man/*" > /dev/null; then
      install -Dm644 man/* -t "${pkgdir}/usr/share/man/man1"
    fi
}
