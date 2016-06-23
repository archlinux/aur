# Contributor: leonid <comdir@infonix.info>
pkgname=nrserver2-free
pkgver=2.3.1.4360
pkgrel=1
pkgdesc="NeoRouter is a cross-platform zero-configuration VPN solution"
url="http://www.neorouter.com/"
license=('custom')
arch=('i686' 'x86_64')
conflicts=('nrserver' 'nrserver-free')
provides=('nrserver' 'nrserver-free' 'nrserver2-free')
options=('!strip')
depends=()
makedepends=('rpmextract')
install=nrserver-free.install
source=('http://download.neorouter.com/Downloads/NRFree/Update_2.3.1.4360/Linux/CentOS/nrserver-2.3.1.4360-free-centos-i386.rpm' 'nrserver.service')
md5sums=('1f295ba9b83516720e37fb96e851736e'
'd36bf55b94871288697eead0f878614c')
if test "$CARCH" == x86_64; then
source=('http://download.neorouter.com/Downloads/NRFree/Update_2.3.1.4360/Linux/CentOS/nrserver-2.3.1.4360-free-centos-x86_64.rpm' 'nrserver.service')
md5sums=('736946473cc4038e3a8b2274012f483e'
'd36bf55b94871288697eead0f878614c')
fi
 
build() {
case ${CARCH} in
i686)
cd $srcdir/
rpmextract.sh $startdir/src/nrserver-2.3.1.4360-free-centos-i386.rpm
rm $startdir/src/nrserver-2.3.1.4360-free-centos-i386.rpm
;;
x86_64)
cd $srcdir/
rpmextract.sh $startdir/src/nrserver-2.3.1.4360-free-centos-x86_64.rpm
rm $startdir/src/nrserver-2.3.1.4360-free-centos-x86_64.rpmm
;;
esac
}
 
package() {
cd $srcdir/
 
msg2 "Installing bin Files..."
mkdir -p "$pkgdir/usr/bin"
cp usr/bin/* "$pkgdir/usr/bin"
 
msg2 "Installing readme files..."
mkdir -p "$pkgdir/usr/local/ZebraNetworkSystems/NeoRouter/"
cp usr/local/ZebraNetworkSystems/NeoRouter/* "$pkgdir/usr/local/ZebraNetworkSystems/NeoRouter/"
 
msg2 "Installing systemd service..."
mkdir -p $pkgdir/usr/lib/systemd/system/
cp $startdir/nrserver.service $pkgdir/usr/lib/systemd/system/
}
