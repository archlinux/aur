# Maintainer: Pavle Barši <pakibarsipavle@gmail.com>

pkgname=mcmodm
pkgver=1.3.sc 
pkgrel=1
pkgdesc="Minecraft Mod Manager written in C++"
arch=('x86_64')
url="https://github.com/MidnightPavlaka635920/Minecraft-ModM"
license=('MIT')
depends=('curl' 'nlohmann-json' 'gcc')
makedepends=('make' 'gcc' 'curl' 'nlohmann-json')

# VCS source, tag will be determined by pkgver()
source=("git+https://github.com/MidnightPavlaka635920/Minecraft-ModM.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/Minecraft-ModM"
    # Picks latest stable tag like v1.3 or v1.3-sc
    git tag | sort -V | tail -n1 | sed 's/^v//'
}

build() {
    cd "${srcdir}/Minecraft-ModM"
    git checkout "v$(pkgver)"
    make
}

package() {
    cd "${srcdir}/Minecraft-ModM"
    # Install the binary
    install -Dm755 mcpk "${pkgdir}/usr/bin/mcpk"
    # Install README
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
