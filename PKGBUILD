# Maintainer: Yarema aka Knedlyk <yupadmin@gmail.com>

pkgname=rtl8761usb
pkgver=20201202
pkgrel=3
pkgdesc="Realtek bluetooth modules for RTL8761 usb based devices"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://www.xmpow.com/pages/download"
license=('unknown')
source=("https://mpow.s3-us-west-1.amazonaws.com/${pkgver}_mpow_BH456A_driver+for+Linux.7z")
conflicts=('rtl8761b-fw')
depends=('linux')
makedepends=('linux-headers')
install=depmod.install

prepare() {
    cd ${pkgver}_LINUX_BT_DRIVER
    sed -i 's/=\ \/lib/=\ \.\/lib/g'  Makefile
    sed -i 's/=\ \/lib/=\ \.\.\/lib/g'  */Makefile
    sed -i 's/depmod/\# depmod/g'  */Makefile
    sed -i 's/rmmod/\# rmmod/g'  */Makefile
    sed -i 's/rtk_btusb/rtl8761usb/g'  Makefile
    sed -i 's/rtk_btusb/rtl8761usb/g'  */Makefile
    sed -i 's/rtk_btusb/rtl8761usb/g'  */*/Makefile
}
package() {
    cd ${pkgver}_LINUX_BT_DRIVER
    make install INTERFACE=usb
    install -d "$pkgdir/usr/lib/"
    cp -r lib/* "$pkgdir/usr/lib/"
}
md5sums=('994ad1d6f6bd1e63190dfef7f64bbb34')
