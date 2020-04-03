# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

_pkgname=pexip-infinity-connect
pkgname="${_pkgname}-bin"
pkgdesc='Pexip Infinity Connect App'
_buildno_in_url='52920.61.0'
pkgver="1.6.0"
pkgrel=1
url='https://www.pexip.com/apps'
license=('custom')
arch=('x86_64')
depends=('nss' 'xdg-utils' 'gtk3' 'libxss')
source=("https://dl.pexip.com/connect/nextgen/${pkgver%.*}/${_pkgname}_${pkgver}-${_buildno_in_url}_linux-x64.deb")
md5sums=('94e6d372bbcfa72cfe7d677c5f1b79fe')
sha1sums=('b6cecdb29dc5e3e28e3c2b9051e89b6f1d5d8f22')
sha512sums=('fc91c919fce22faf864ec693a268b18ddf455f40ca3d4b48c99dcaa583e44c5c63fdaf9369217478f05a382f6a217b4e79e93d1ea10dc05ed22290b90e4399ea')

package() {
    tar --no-same-owner -xJC "$pkgdir" -f data.tar.xz

    install -d "$pkgdir/usr/share/licenses/$pkgname"
    for license_file in LICENSE LICENSES.chromium.html; do
        mv "$pkgdir/usr/lib/pexip-infinity-connect_linux-x64/${license_file}" \
            "$pkgdir/usr/share/licenses/$pkgname"
    done

    ln -s /usr/lib/pexip-infinity-connect_linux-x64/pexip-infinity-connect \
        "$pkgdir/usr/bin/pexip-infinity-connect"
}
