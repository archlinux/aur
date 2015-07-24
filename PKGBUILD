# Maintainer: mibbio <contact at mibbiodev dot de>
# Contributor: jjacky
# Contributor: dunningd <duncansdunning at yahoo dot co dot uk>
# Adapted/copied from netbeans-cpp 6.9.1 (Thanks wimvdh)
pkgname=netbeans-cpp
pkgver=8.0.2
pkgrel=4
pkgdesc="Netbeans IDE development platform - C/C++ only"
arch=('i686' 'x86_64')
url="https://netbeans.org/"
license=('CDDL')
depends=('java-runtime')
provides=('netbeans')
conflicts=('netbeans')
replaces=('netbeans-cpp-beta')
options=('!strip')
install=netbeans.install
backup=('usr/share/netbeans/etc/netbeans.conf')
source=(http://download.netbeans.org/netbeans/$pkgver/final/bundles/netbeans-$pkgver-cpp-linux.sh
        netbeans.desktop)
md5sums=('285d6e80e29f81721c30484b46e777c5'
         'eb9c35b558997f62a52bddad16dba248')

package() {
  mkdir -p $pkgdir/usr/share/netbeans
  /bin/sh $srcdir/../netbeans-$pkgver-cpp-linux.sh --silent --userdir $srcdir -J-Dnb-base.installation.location=$pkgdir/usr/share/netbeans
  rm $pkgdir/usr/share/netbeans/bin/netbeans.exe
  rm $pkgdir/usr/share/netbeans/bin/netbeans64.exe
  rm $pkgdir/usr/share/netbeans/uninstall.sh
  install -D -m644 $srcdir/netbeans.desktop $pkgdir/usr/share/applications/netbeans.desktop
  for licensefile in LICENSE.txt THIRDPARTYLICENSE.txt
  do
    install -D -m644 $pkgdir/usr/share/netbeans/$licensefile $pkgdir/usr/share/licenses/$pkgname/$licensefile
    rm $pkgdir/usr/share/netbeans/$licensefile
  done
  mkdir -p $pkgdir/usr/bin
  ln -s /usr/share/netbeans/bin/netbeans $pkgdir/usr/bin/netbeans
}
