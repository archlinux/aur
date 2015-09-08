# Maintainer: Maxim Kraev <maxim.kraev@gmail.com>

pkgname=ifcplugin
pkgver=2.0.6.0
pkgrel=1
_ubuntuver=raring
_ubunturel=1
pkgdesc="Crypto Interface Web Browser Plugin for https://gosuslugi.ru"
arch=('i686' 'x86_64')
url="https://esia.gosuslugi.ru"
license=('unknown')
depends=(pcsc-tools glibc acsccid)
conflicts=()
if [[ "$CARCH" == "i686" ]]; then
  source=("https://ds-plugin.gosuslugi.ru/plugin/htdocs/plugin/IFCPlugin-i386.deb")
  sha512sums=('1d6dbfda3e826ea0b632c29691fd71242373a6238832b947ade5343f7315aeb24b824571dff9907b7ea05d78a0e8e091c87f47c2626f6cc77f69d9b5a9723226')
else
  source=("https://ds-plugin.gosuslugi.ru/plugin/htdocs/plugin/IFCPlugin-x86_64.deb")
  sha512sums=('b7d50ddc35c1e0b81f564b08a8cb58d903fcbf003dab91c02e5db2404dd6493e25b7c7cb2061b8d112ab4c0109d482855c438a479e328d7fe5ebda830c5af510')
fi
install=ifcplugin.install

package() {
  cd "$srcdir"
  bsdtar -xf data.tar.gz -C "$pkgdir"

  sed -i "s/ifd-ccid.bundle/ifd-acsccid.bundle/g" $pkgdir/etc/update_ccid_boundle/update_ccid_boundle.sh

  mkdir -p $pkgdir/var/log/ifc
  mkdir -p $pkgdir/var/log/ifc/engine_logs
  chmod 777 $pkgdir/var/log/ifc
  chmod 777 $pkgdir/var/log/ifc/engine_logs
}
