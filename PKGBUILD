# Contributor: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=ifcplugin
pkgver=3.1.1.0
pkgrel=2
pkgdesc="Crypto Interface Web Browser Plugin for https://gosuslugi.ru/"
arch=('i686' 'x86_64')
url="https://ds-plugin.gosuslugi.ru/plugin/upload/Index.spr"
license=('unknown')
depends=("pcsc-tools" "glibc" "acsccid")
install="ifcplugin.install"

source_x86_64=("$pkgname-$pkgver.rpm::https://ds-plugin.gosuslugi.ru/plugin/upload/assets/distrib/IFCPlugin-x86_64.rpm")
sha256sums_x86_64=("7fa0df9cda6c0b2352d5cf1530289cc8fe93e961f9f135178cef12aa8ad19957")
source_i686=("$pkgname-$pkgver.rpm::https://ds-plugin.gosuslugi.ru/plugin/upload/assets/distrib/IFCPlugin-i386.rpm")
sha256sums_i686=("92c9253417a01bbb143fdb34448febf6e264b6b7d64aad3b47e3ece8bd181d57")

package() {
  rm -rf "$srcdir/usr/lib64"
  cp -r "$srcdir/etc/" "$pkgdir/etc"
  cp -r "$srcdir/usr/" "$pkgdir/usr"
  cp -r "$srcdir/opt/" "$pkgdir/opt"
  mkdir -p $pkgdir/var/log/ifc
  mkdir -p $pkgdir/var/log/ifc/engine_logs

  sed -i "s/ifd-ccid.bundle/ifd-acsccid.bundle/g" "$pkgdir/etc/update_ccid_boundle/update_ccid_boundle.sh"
  wget -O "$srcdir/etc/ifc.cfg" https://www.cryptopro.ru/sites/default/files/public/faq/ifcx64.cfg
}
