# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=minimserver
pkgver=0.8.5.2
pkgrel=6
pkgdesc="UPnP Audio Server"
arch=('x86_64' 'aarch64')
url="http://www.minimserver.com"
license=('custom:minimserver')
depends=('jre8-openjdk' 'bash')
install=${pkgname}.install
source_aarch64=("http://jminim.com/brac/MinimServer-$pkgver-linux-arm64.tar.gz" "minimserver.service" "startd" "stopall")
source_x86_64=("http://jminim.com/brac/MinimServer-$pkgver-linux-intel.tar.gz" "minimserver.service" "startd" "stopall")
sha256sums_aarch64=('SKIP' 'bf4aa3138405551d56799a46853c5aec3a5fa596535623945ea03fc9dcba60e7' 'b62defecce18a435d01a516c9f00005372eef402697df1c7fc61f0a661c81819' '3eb10e9e28b08b708e02328661ffe8810ae1e0fc653c396c41e4cd15d393dfea')
sha256sums_x86_64=('SKIP' 'bf4aa3138405551d56799a46853c5aec3a5fa596535623945ea03fc9dcba60e7' 'b62defecce18a435d01a516c9f00005372eef402697df1c7fc61f0a661c81819' '3eb10e9e28b08b708e02328661ffe8810ae1e0fc653c396c41e4cd15d393dfea')

package() {
  cd $srcdir
  
  mkdir -p -m 777 $pkgdir/opt/minimserver/tmp/
  cp -r $srcdir/$pkgname/$pkgname-$pkgver/* "$pkgdir/opt/minimserver/"
  rm $pkgdir/opt/minimserver/bin/startd
  rm $pkgdir/opt/minimserver/bin/stopall
  install -Dm755 startd ${pkgdir}/opt/minimserver/bin/startd
  install -Dm755 stopall ${pkgdir}/opt/minimserver/bin/stopall
  install -Dm644 "minimserver.service" $pkgdir/usr/lib/systemd/user/minimserver.service
}
