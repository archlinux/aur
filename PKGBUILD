# Maintainer: mibbio <contact at mibbiodev dot de>
# Contributor: jjacky
# Contributor: dunningd <duncansdunning at yahoo dot co dot uk>
# Adapted/copied from netbeans-cpp 6.9.1 (Thanks wimvdh)
pkgname=netbeans-cpp
pkgver=8.2
pkgrel=1
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
source_x86_64=(netbeans-$pkgver-cpp-linux.sh::http://download.netbeans.org/netbeans/$pkgver/final/bundles/netbeans-$pkgver-cpp-linux-x64.sh)
source_i686=(netbeans-$pkgver-cpp-linux.sh::http://download.netbeans.org/netbeans/$pkgver/final/bundles/netbeans-$pkgver-cpp-linux-x86.sh)
source=(netbeans.desktop)
md5sums=('eb9c35b558997f62a52bddad16dba248')
sha256sums_i686=('5e152971e57af1a94a4888217de4b59b0a2729a19b7a557dcb36e691c6bfa9bc')
sha256sums_x86_64=('d6a89152b36be513c50764fcbfdd975076727f8333b46d1e60798c9fb79196e5')
# md5sums_i686=('3c3d7f2ac6a2e5a4fa380611aac3a6c5')
# md5sums_x86_64=('0d58114beabc57b134abeaf9c66adbf7')

package() {
  mkdir -p $pkgdir/usr/share/netbeans
  /bin/sh $srcdir/../netbeans-$pkgver-cpp-linux.sh --silent --userdir $srcdir -J-Dnb-base.installation.location=$pkgdir/usr/share/netbeans
  rm $pkgdir/usr/share/netbeans/bin/netbeans.exe
  rm -f $pkgdir/usr/share/netbeans/bin/netbeans64.exe
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
