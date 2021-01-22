# Contributor: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=ifcplugin
pkgver=3.1.1.0
pkgrel=3
pkgdesc="Crypto Interface Web Browser Plugin for https://gosuslugi.ru/"
arch=('i686' 'x86_64')
url="https://ds-plugin.gosuslugi.ru/plugin/upload/Index.spr"
license=('unknown')
depends=("pcsc-tools" "glibc" "acsccid")
install="ifcplugin.install"

source_x86_64=("$pkgname-$pkgver.rpm::https://ds-plugin.gosuslugi.ru/plugin/upload/assets/distrib/IFCPlugin-x86_64.rpm")
sha256sums_x86_64=("c91c5a52d3fb21a7bb43f97ed97a6fba489af1399fe88631e9b859642863bfee")
source_i686=("$pkgname-$pkgver.rpm::https://ds-plugin.gosuslugi.ru/plugin/upload/assets/distrib/IFCPlugin-i386.rpm")
sha256sums_i686=("ca61dd6e477c0db3ba79e482448fe5267fe71fbf1841d43eb41e4f7cb78ed3dd")

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
