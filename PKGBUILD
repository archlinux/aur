# Maintainer: Alexey Manukhin <axxapy@gmail.com>

pkgname=virtualhere-server-bin
pkgver=4.6.4
pkgrel=1
pkgdesc="VirtualHere USB Server for Linux Desktop"
arch=("i686" "x86_64")
url="https://www.virtualhere.com/usb_server_software"
license=("custom")
optdepends=("avahi: systemd unit support")
provides=("virtualhere")
conflicts=("virtualhere")
options=(!strip)
source=("virtualhere.service")
source_i686=("https://www.virtualhere.com/sites/default/files/usbserver/vhusbdi386")
source_x86_64=("https://www.virtualhere.com/sites/default/files/usbserver/vhusbdx86_64")
md5sums=('b317ad221de44c968d2368825e1682fe')
md5sums_i686=('SKIP')
md5sums_x86_64=('SKIP')

build() {
    mv vhusbd* vhusbd
    chmod +x vhusbd
    ./vhusbd -l > LICENSE
}

pkgver() {
    chmod +x "${srcdir}/vhusbdx86_64"
    "${srcdir}/vhusbdx86_64" --help 2>/dev/null | head -n 1| sed 's/.*\([0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\).*/\1/'
}

package() {
    install -Dm755 vhusbd              "${pkgdir}/usr/bin/vhusbd"
    install -Dm644 virtualhere.service "${pkgdir}/etc/systemd/system/virtualhere.service"
    install -Dm644 LICENSE             "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
