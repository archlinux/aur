# Maintainer: DonKeyPWN
pkgname=general-tools
pkgver=1.2.0
pkgrel=1
pkgdesc='Tools for homebrew development'
arch=('x86_64')
url='https://github.com/devkitPro/general-tools'
license=('GPL3')
groups=(
    'gp32-dev'
    'gp2x-dev'
    'gba-dev'
    'nds-dev'
    '3ds-dev'
    'switch-dev'
    'gamecube-dev'
    'wii-dev'
    'wiiu-dev'
)
makedepends=('git')

pkgcid=c1c3b1547d2ba48dd221553f1d62167cadc70d28 # Commit ID from https://github.com/devkitPro/general-tools/tree/v${pkgver}
source=("${pkgname}-${pkgver}::git+https://github.com/devkitPro/general-tools.git#commit=${pkgcid}")
sha256sums=('SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    ./autogen.sh
    ./configure --prefix="${pkgdir}/opt/devkitpro/tools"
    make
}

package() {
    install -d ${pkgdir}/opt/devkitpro/{licenses/general-tools,tools}
    cp ${pkgname}-${pkgver}/COPYING ${pkgdir}/opt/devkitpro/licenses/general-tools/
    make -C "${pkgname}-${pkgver}" install
}
