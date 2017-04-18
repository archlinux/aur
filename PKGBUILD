# Maintainer: Christopher Bero <bigbero@gmail.com>
# Taken from https://aur.archlinux.org/packages/mspds
# PKGBUILD copied from https://github.com/greigdp/msp430-mspds
# Contributor: Alexei Colin <ac@alexeicolin.com>
pkgname=mspds
pkgver=3.09.002.015
pkgrel=1
pkgdesc="MSP430 Debug Stack. Contains a dynamic link library as well as embedded firmware that runs on the MSP-FET430UIF or the eZ430 emulators."
arch=('i686' 'x86_64')
url="http://www.ti.com/tool/mspds"
# Licenses were found in "Manifest MSPDebugStack OS Package.pdf" from the mspds source archive.
license=('custom:TI BSD' 'custom:IAR BSD' 'custom: TI TSPA')
group=('msp430')
depends=('hidapi' 'boost')
makedepends=('unzip' 'dos2unix')
optdepends=('mspdebug')
#_release='slac460s'
_releasefile="msp430.dll_developer_package_rev_3_09_002_015.zip"
noextract=("${_releasefile}")
source=("http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSPDS/latest/exports/msp430.dll_developer_package_rev_3_09_002_015.zip"
        'hidapi.patch')

sha256sums=('709eef7be35c69bc4ce204cf8dd367b1495bd50fc00f37d5bdd60442800e60ef'
            'aa2bdb86118a84423f3df752f48d90d2ebcb1e1bbc5293bdfd7fb1c62f765a34')

prepare() {
    unzip ${_releasefile}
    find ./ -type f -exec dos2unix -q '{}' \;
    # This hidapi patch allows us to build mspds from the hidapi Archlinux package rather than the v0.7 source.
    #patch -p1 -d . < ../hidapi.patch
}

build() {
    cd "$srcdir"
    #make
}

package() {
    install -Dm644 "$srcdir/MSP430_DLL_Developer_Package_Rev_3_9_2_15/libmsp430.so" "$pkgdir/usr/lib/libmsp430.so"
}
