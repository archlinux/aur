# Maintainer: Maxim Kraev <maxim.kraev@gmail.com>; Stepanov Aleksandr <sa@eri.su>

pkgname=ifcplugin
pkgver=3.0.7.0
pkgrel=2
_ubuntuver=raring
_ubunturel=1
pkgdesc="Crypto Interface Web Browser Plugin for https://gosuslugi.ru"
arch=('i686' 'x86_64')
url="https://esia.gosuslugi.ru"
license=('unknown')
depends=(pcsc-tools glibc acsccid)
conflicts=()

# 690ef5300f03eae34a76c3e0d424ca7bb857d4fe1dafd0b901a6a010b31f046f  /home/eri/Downloads/IFCPlugin-i386.deb
# 2f5736ea87c90833fb372ccc8d0f58795546cb08ee2663b53503f92778c206e4  /home/eri/Downloads/IFCPlugin-x86_64.deb
# 090d81c342f04104cf9a9678b98010f70abc311098d5c3f3e7d3572c3c15afe0fcedfe9ef5be46158182748ec27d3f1a6d5e26e54af9fce19cfcc04c29025239  /home/eri/Downloads/IFCPlugin-i386.deb
# c89fef2c82903baa7b6d9bd9df2beefa844427db709a4a9ddd97184cfffd2ba18a0df3ead7cfcb14cb3d234cc7cf78197b75759a95a127162d199e8689f24d94  /home/eri/Downloads/IFCPlugin-x86_64.deb


if [[ "$CARCH" == "i686" ]]; then
  source=("https://ds-plugin.gosuslugi.ru/plugin/htdocs/plugin/IFCPlugin-i386.deb")
  sha512sums=('090d81c342f04104cf9a9678b98010f70abc311098d5c3f3e7d3572c3c15afe0fcedfe9ef5be46158182748ec27d3f1a6d5e26e54af9fce19cfcc04c29025239')
else
  source=("https://ds-plugin.gosuslugi.ru/plugin/htdocs/plugin/IFCPlugin-x86_64.deb")
  sha512sums=('c89fef2c82903baa7b6d9bd9df2beefa844427db709a4a9ddd97184cfffd2ba18a0df3ead7cfcb14cb3d234cc7cf78197b75759a95a127162d199e8689f24d94')
fi
install=ifcplugin.install

package() {
  cd "$srcdir"
  bsdtar -xf data.tar.xz -C "$pkgdir"

  sed -i "s/ifd-ccid.bundle/ifd-acsccid.bundle/g" $pkgdir/etc/update_ccid_boundle/update_ccid_boundle.sh

  mkdir -p $pkgdir/var/log/ifc
  mkdir -p $pkgdir/var/log/ifc/engine_logs
  chmod 777 $pkgdir/var/log/ifc
  chmod 777 $pkgdir/var/log/ifc/engine_logs
}
