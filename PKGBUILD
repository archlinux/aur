# Maintainer:  alchitry <support@alchitry.com>
# Contributor:  r1cebank <rbnk@elica.io>

pkgname=alchitry-labs-beta-bin
_pkgname=alchitry-labs-beta
pkgver=2.0.55
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
sha256sums=("2c4b7e200cdaba5210829b0ef5396fb0d2a0120ababd82aa86bc23693a99f2b2")

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