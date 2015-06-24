# Maintainer: Maxim Kraev <maxim.kraev@gmail.com>

pkgname=ifcplugin
pkgver=2.0.5.7
pkgrel=4
_ubuntuver=raring
_ubunturel=4
pkgdesc="Crypto Interface Web Browser Plugin for https://gosuslugi.ru"
arch=('i686' 'x86_64')
url="https://esia.gosuslugi.ru"
license=('unknown')
depends=(pcsc-tools glibc acsccid)
conflicts=()
if [[ "$CARCH" == "i686" ]]; then
  source=("https://esia.gosuslugi.ru/sia-web/htdocs/plugin/IFCPlugin-i386.deb")
  sha512sums=('c4c71c9bf081270f3381d1b3ba4b67d1d5c5755171e59ca59108058aa6e9645c34c81f14235da18712a4a04fd6a12abf110bc82b689a14f789afa354368fe8e9')
else
  source=("https://esia.gosuslugi.ru/sia-web/htdocs/plugin/IFCPlugin-x86_64.deb")
  sha512sums=('2bd547bea60c703018821942d8d496d4e36bf4e580ea517fa7ef7596faa4f944e7f31ce641ad5da21baad17ed82f5b373118860dd8a258b5cb7243ae36f3df3c')
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
