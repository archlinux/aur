# Maintainer: Stefan Zipproth <s.zipproth@acrion.ch>

pkgname=nexuslua
pkgver=0.9.2
pkgrel=1
pkgdesc="True, hardware-level multithreading for Lua through an asynchronous agent model."
arch=('x86_64')
url="https://github.com/acrion/nexuslua"
license=('AGPL-3.0-or-later')
depends=('openssl' 'zlib')
makedepends=('cmake' 'git' 'gcc' 'lua')
source=("git+https://github.com/acrion/nexuslua.git#tag=v${pkgver}"
        "nexuslua.1")
sha256sums=('SKIP'
            'SKIP')

build() {
    cd "${pkgname}"
    cmake -B build -S src \
          -DINSTALL_GTEST=OFF \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_BUILD_TYPE=Release

    cmake --build build
}
package() {
    cd "${pkgname}"
    DESTDIR="$pkgdir/" cmake --install build
    install -Dm644 "${srcdir}/nexuslua.1" "${pkgdir}/usr/share/man/man1/nexuslua.1"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
