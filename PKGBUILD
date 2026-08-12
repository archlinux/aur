# Maintainer:  alchitry <support@alchitry.com>
# Contributor:  r1cebank <rbnk@elica.io>

pkgname=alchitry-labs-beta-bin
_pkgname=alchitry-labs-beta
pkgver=2.0.59
pkgrel=1
pkgdesc='Alchitry Labs - The Easiest Way to Program FPGAs (Beta Binary Release)'
arch=('x86_64')
license=('custom: commercial')
url='https://alchitry.com/alchitry-labs'
provides=('alchitry-labs' 'alchitry-labs-beta')
conflicts=('alchitry-labs-beta')
depends=('gmp' 'alsa-lib' 'glibc' 'libxi' 'libxtst')

# Prevent Arch from stripping binaries, which corrupts the bundled Tclkit
options=('!strip')

source=("$pkgname-$pkgver.tar.gz::https://github.com/alchitry/Alchitry-Labs-V2-Beta/releases/download/$pkgver/alchitry-labs-beta-$pkgver-linux-amd64.tar.gz")
sha256sums=("cd800642244bb4257e6d3be83ecdf1826b5512db223abb1791d8a6cd1bb1aa4f")

package() {
    local _appdir="/usr/lib/alchitry/${_pkgname}"
    mkdir -p "${pkgdir}/${_appdir}"
    mkdir -p "${pkgdir}/usr/share"
    mkdir -p "${pkgdir}/usr/bin"

    cd "$srcdir/$_pkgname-$pkgver"

    cp -a --no-preserve=ownership share/* "${pkgdir}/usr/share/"
    cp -a --no-preserve=ownership bin lib "${pkgdir}/${_appdir}/"

    ln -s "${_appdir}/bin/alchitry" "${pkgdir}/usr/bin/alchitry"
    ln -s "${_appdir}/bin/alchitry-labs" "${pkgdir}/usr/bin/alchitry-labs"
}