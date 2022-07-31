# Maintainer: DonKeyPWN
pkgname=gamecube-tools
pkgver=1.0.3
pkgrel=1
pkgdesc='gamecube tools'
arch=('x86_64')
url='https://github.com/devkitPro/gamecube-tools'
license=('GPL3')
groups=(
    'gamecube-dev'
    'wii-dev'
)
makedepends=(
    'freeimage'
    'git'
)

pkgcid=21e671615cd9531c9c14c8f249bdb231af27f616 # Commit ID from https://github.com/devkitPro/gamecube-tools/tree/v${pkgver}
source=(
    "${pkgname}-${pkgver}::git+https://github.com/devkitPro/gamecube-tools.git#commit=${pkgcid}"
)
sha256sums=('SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    ./autogen.sh
    ./configure --prefix="${pkgdir}/opt/devkitpro/tools"
    make
}

package() {
    install -d ${pkgdir}/opt/devkitpro/{licenses/gamecube-tools,tools}
    cp ${pkgname}-${pkgver}/COPYING ${pkgdir}/opt/devkitpro/licenses/gamecube-tools/
    make -C "${pkgname}-${pkgver}" install
}
