# Maintainer:  alchitry <support@alchitry.com>
# Contributor:  r1cebank <rbnk@elica.io>

pkgname=alchitry-labs-v2-bin
_pkgname=alchitry-labs
pkgver=2.0.47
pkgrel=1
pkgdesc='Alchitry Labs - The Easiest Way to Program FPGAs'
arch=(x86_64)
license=('custom: commercial')
url='https://alchitry.com/alchitry-labs'
provides=(alchitry-labs)
conflicts=(alchitry-labs)
depends=('gmp' 'alsa-lib' 'glibc' 'libxi' 'libxtst')

source=("$pkgname-$pkgver.tar.gz::https://github.com/alchitry/Alchitry-Labs-V2/releases/download/$pkgver/alchitry-labs-$pkgver-linux-amd64.tar.gz")
sha256sums=("6907d21f2d45579e5b0576d249c0debfbce0f5e7d21d8eb81556870449c11d1f")

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

    find "${pkgdir}" -type d -exec chmod 755 {} +
    find "${pkgdir}" -type f -exec chmod 644 {} +

    chmod 755 "${pkgdir}/${_appdir}/bin/"*
    chmod 755 "${pkgdir}/${_appdir}/lib/runtime/lib/jspawnhelper"
    chmod 755 "${pkgdir}/${_appdir}/lib/runtime/lib/jexec"
}