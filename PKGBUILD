# Maintainer: Kevlar Kanou <kevlarkanou at outlook dot com>

pkgname=ti-c2000ware
pkgver=3.04.00.00
pkgrel=1
pkgdesc="Texas Instruments C2000Ware library for C2000 Microcontrollers"
arch=('x86_64')
url="https://www.ti.com/tool/C2000WARE"
license=('custom')

# lib32-glibc needed for the installer
makedepends=('lib32-glibc' 'lib32-fakeroot')

_installer=C2000Ware_$(echo $pkgver | sed 's@[.]@_@g')_setup.run
source=("https://software-dl.ti.com/C2000/c2000_apps_public_sw/c2000ware/$(echo $pkgver | sed 's@[.]@_@g')/exports/C2000Ware_$(echo $pkgver | sed 's@[.]@_@g')_setup.run")

options=(!strip libtool staticlibs emptydirs !purge !zipman)
_installdir=opt/ti/c2000

prepare() {
    cd $srcdir
    chmod +x ./${_installer}
}

package() {
    ./${_installer} --mode unattended --prefix $pkgdir/${_installdir}
    install -D -m0644 $pkgdir/${_installdir}/C2000Ware_$(echo $pkgver | sed 's@[.]@_@g')/license.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

sha256sums=('9be4c147c09a72b36379ce92bcef046eedf69576f600a4b9be5fe9ddc004ba74')
