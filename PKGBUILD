# Contributor: leonid <comdir@infonix.info>
pkgname=nrclient2-free
pkgver=2.3.1.4360
pkgrel=1
pkgdesc="NeoRouter is a cross-platform zero-configuration VPN solution"
url="http://www.neorouter.com/"
license=('custom')
arch=('i686' 'x86_64')
conflicts=('nrclient' 'nrclient-free')
provides=('nrclient' 'nrclient-free' 'nrclient2-free')
options=('!strip')
depends=()
makedepends=('rpmextract')
install=nrclient.install
source=('http://download.neorouter.com/Downloads/NRFree/Update_2.3.1.4360/Linux/CentOS/nrclient-2.3.1.4360-free-centos-i386.rpm' 'nrclient.service')
md5sums=('81b4c36a9c1178086f59bf5d62b4527c'
'051c0ba7598249e035368f8ecb6ea44d')
if test "$CARCH" == x86_64; then
source=('http://download.neorouter.com/Downloads/NRFree/Update_2.3.1.4360/Linux/CentOS/nrclient-2.3.1.4360-free-centos-x86_64.rpm' 'nrclient.service')
md5sums=('046449a46ee5e7b6bc67b8c079e3e307'
'051c0ba7598249e035368f8ecb6ea44d')
fi

build() {
case ${CARCH} in
i686)
cd $srcdir/
rpmextract.sh $startdir/src/nrclient-2.3.1.4360-free-centos-i386.rpm
rm $startdir/src/nrclient-2.3.1.4360-free-centos-i386.rpm
;;
x86_64)
cd $srcdir/
rpmextract.sh $startdir/src/nrclient-2.3.1.4360-free-centos-x86_64.rpm
rm $startdir/src/nrclient-2.3.1.4360-free-centos-x86_64.rpm
;;
esac
}

package() {
cd $srcdir/

msg2 "Installing bin files..."
mkdir -p "$pkgdir/usr/bin"
cp usr/bin/* "$pkgdir/usr/bin"

msg2 "Installing readme files..."
mkdir -p "$pkgdir/usr/local/ZebraNetworkSystems/NeoRouter/"
cp usr/local/ZebraNetworkSystems/NeoRouter/* "$pkgdir/usr/local/ZebraNetworkSystems/NeoRouter/"

msg2 "Installing systemd service..."
mkdir -p "$pkgdir/usr/lib/systemd/system"
cp $startdir/nrclient.service "$pkgdir/usr/lib/systemd/system"
}