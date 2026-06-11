# Maintainer:  alchitry <support@alchitry.com>
# Contributor:  r1cebank <rbnk@elica.io>

pkgname=alchitry-labs-beta-bin
_pkgname=alchitry-labs-beta
pkgver=2.0.53
pkgrel=2
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
sha256sums=("e0abef8ea590b4bac7411235a0440d8ec637b0aa36e0ae4767123e5b425f0261")

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