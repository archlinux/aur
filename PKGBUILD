# Maintainer: Alexey Manukhin <axxapy@gmail.com>

# Systemd service source:
# https://github.com/virtualhere/script/blob/main/install_server

pkgname=virtualhere-server-bin
pkgver=4.8.5
pkgrel=3
pkgdesc="VirtualHere USB Server for Linux Desktop"
OPTIONS=(!strip)
arch=("i686" "x86_64")
url="https://www.virtualhere.com/usb_server_software"
license=("custom")
provides=("virtualhere")
conflicts=("virtualhere")
source=("virtualhere.service" "config.ini")
source_i686=("https://www.virtualhere.com/sites/default/files/usbserver/vhusbdi386")
source_x86_64=("https://www.virtualhere.com/sites/default/files/usbserver/vhusbdx86_64")
md5sums=('32add976088e8a5b2b306e236afd5071' 'd41d8cd98f00b204e9800998ecf8427e')
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
    install -Dm644 config.ini          "${pkgdir}/etc/virtualhere/config.ini"
    install -Dm644 virtualhere.service "${pkgdir}/etc/systemd/system/virtualhere.service"
    install -Dm644 LICENSE             "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
