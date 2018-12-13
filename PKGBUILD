# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: jose <jose1711 [at] gmail (dot) com>

pkgname=mytourbook_bin
pkgver=18.12.1
pkgrel=1
pkgdesc="A tool to visualize and analyze tours recorded by a GPS device, ergometer, bike- or exercise computer."
arch=('i686' 'x86_64')
url="http://mytourbook.sourceforge.net"
license=("GPL")
depends=('jre8-openjdk' 'fontconfig' 'libxrender')
install="mytourbook.install"
source=("mytourbook.desktop")
options=(!strip)
sha256sums=('84607b0ae8313aaf4e466ff41a8c6d7d32d5fb4b1609463d99084b0c13d3036a')

[ "$CARCH" = "i686"   ] && source=(${source[@]} "http://downloads.sourceforge.net/project/mytourbook/MyTourbook/${pkgver}/mytourbook-${pkgver}-linux-32.zip")
[ "$CARCH" = "x86_64" ] && source=(${source[@]} "http://downloads.sourceforge.net/project/mytourbook/MyTourbook/${pkgver}/mytourbook-${pkgver}-linux-64.zip")

[ "$CARCH" = "i686"   ] && sha256sums=(${sha256sums[@]} 'ad687466fa6433563f412b24211a780c478cdbe652552323b04506fb6eae1217')
[ "$CARCH" = "x86_64" ] && sha256sums=(${sha256sums[@]} '546842f06da9ef83f46e019af9666a6e2f4d36c4dc722b282bd1deebeeef5d74')

package() {
  mkdir -p ${pkgdir}/usr/{bin,share/mytourbook}
  cd ${srcdir}/mytourbook
  tar cf - --exclude=.PKGINFO * | ( cd ${pkgdir}/usr/share/mytourbook; tar xfp -)
  find ${pkgdir}/usr/share/mytourbook -type f -print0 | xargs -0 chmod 644
  chmod 755 ${pkgdir}/usr/share/mytourbook/mytourbook
  ln -s /usr/share/mytourbook/mytourbook ${pkgdir}/usr/bin/mytourbook

  install -D -m644 icon.xpm $pkgdir/usr/share/pixmaps/mytourbook.xpm
  install -D -m644 $srcdir/mytourbook.desktop $pkgdir/usr/share/applications/mytourbook.desktop
}

# vim:set ts=2 sw=2 noet:
