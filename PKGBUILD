# Maintainer: jose <jose1711 [at] gmail (dot) com>
# Contributor: nblock <nblock [/at\] archlinux DOT us>

pkgname=mytourbook_bin
pkgver=17.4.0
pkgrel=1
pkgdesc="A tool to visualize and analyze tours recorded by a GPS device, ergometer, bike- or exercise computer."
arch=('i686' 'x86_64')
url="http://mytourbook.sourceforge.net"
license=("GPL")
depends=('jre8-openjdk' 'fontconfig' 'libxrender')
install="mytourbook.install"
source=("mytourbook.desktop")
options=(!strip)
md5sums=('428a78ad67746b149ccb8e70cc8b086b')

[ "$CARCH" = "i686"   ] && source=(${source[@]} "http://downloads.sourceforge.net/project/mytourbook/MyTourbook/${pkgver}/mytourbook-${pkgver}-linux-32.zip")
[ "$CARCH" = "x86_64" ] && source=(${source[@]} "http://downloads.sourceforge.net/project/mytourbook/MyTourbook/${pkgver}/mytourbook-${pkgver}-linux-64.zip")

[ "$CARCH" = "i686"   ] && md5sums=(${md5sums[@]} 'c1044c0bc6913ce044ffa2af9f70fb13')
[ "$CARCH" = "x86_64" ] && md5sums=(${md5sums[@]} '67d8d42241f68b2669e72df3ff439b8e')

package() {
  mkdir -p ${pkgdir}/usr/{bin,share/mytourbook}
  cd ${srcdir}/mytourbook
  tar cf - * --exclude=.PKGINFO | ( cd ${pkgdir}/usr/share/mytourbook; tar xfp -)
  find ${pkgdir}/usr/share/mytourbook -type f -print0 | xargs -0 chmod 644
  chmod 755 ${pkgdir}/usr/share/mytourbook/mytourbook
  ln -s /usr/share/mytourbook/mytourbook ${pkgdir}/usr/bin/mytourbook

  install -D -m644 icon.xpm $pkgdir/usr/share/pixmaps/mytourbook.xpm
  install -D -m644 $srcdir/mytourbook.desktop $pkgdir/usr/share/applications/mytourbook.desktop
}

# vim:set ts=2 sw=2 noet:
