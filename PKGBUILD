# Maintainer:  alchitry <support@alchitry.com>
# Contributor:  r1cebank <rbnk@elica.io>

pkgname=alchitry-labs-bin
_pkgname=alchitry-labs
pkgver=2.0.52
pkgrel=1
pkgdesc='Alchitry Labs - The Easiest Way to Program FPGAs'
arch=(x86_64)
license=('custom: commercial')
url='https://alchitry.com/alchitry-labs'
provides=(alchitry-labs)
conflicts=(alchitry-labs)
depends=('gmp' 'alsa-lib' 'glibc' 'libxi' 'libxtst')

# Prevent Arch from stripping binaries, which corrupts the bundled Tclkit
options=('!strip')

source=("$pkgname-$pkgver.tar.gz::https://github.com/alchitry/Alchitry-Labs-V2/releases/download/$pkgver/alchitry-labs-$pkgver-linux-amd64.tar.gz")
sha256sums=("cc07ac1d2142ff5d6faacc1482ed074b1f94f20ce6b6e88ee1371333c3e15199")

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