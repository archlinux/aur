# Maintainer:  alchitry <support@alchitry.com>
# Contributor:  r1cebank <rbnk@elica.io>

pkgname=alchitry-labs-bin
_pkgname=alchitry-labs
pkgver=2.0.51
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
sha256sums=("4a5e2b20f4398e4d74d3c176e43aadd304333d4cc037e8957519a706e927278d")

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