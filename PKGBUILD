# Maintainer: Rahul Garg <rg at vihu dot dev>
pkgname=nordlayer-runit
pkgver=3.0.0
pkgrel=1
pkgdesc="Proprietary VPN client for linux using runit"
arch=('i686' 'x86_64')
url='https://nordlayer.com'
license=('custom')
depends=('bash' 'runit')
install=${pkgname}.install
source_x86_64=("https://downloads.nordlayer.com/linux/latest/debian/pool/main/nordlayer_${pkgver}_amd64.deb" "run")
sha256sums_x86_64=("5ca248b7e2c40f378f7cfa8b8210cc6916f7583772e1d862faff8812837a9c74" "bd1c0b613eb9b820d8d1c3343564f8e010b3044e2457cedce0e30d11d8af358a")

package(){
    # Extract NordLayer
    bsdtar -O -xf *.deb data.tar.gz | bsdtar -C "${pkgdir}" -xJf -
    cp -r "${pkgdir}/usr/sbin/." "${pkgdir}/usr/bin"
    rm -r "${pkgdir}/usr/sbin"

    # Remove systemd service files
    rm -f "${pkgdir}/usr/lib/systemd/system/nordlayer.service"

    # Install runit service script
    install -Dm755 ${srcdir}/run "$pkgdir"/etc/runit/sv/nordlayer/run
}
