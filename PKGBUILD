# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: jose <jose1711 [at] gmail (dot) com>

pkgname=mytourbook_bin
pkgver=22.6.1
pkgrel=1
pkgdesc="A tool to visualize and analyze tours recorded by a GPS device, ergometer, bike- or exercise computer."
arch=('x86_64')
url="http://mytourbook.sourceforge.net"
license=("GPL")
depends=('java-runtime>=11' 'fontconfig' 'libxrender')
install="mytourbook.install"
source=("mytourbook.desktop" "http://downloads.sourceforge.net/project/mytourbook/MyTourbook/${pkgver}/mytourbook-${pkgver}-linux.zip")
options=(!strip)
sha256sums=('84607b0ae8313aaf4e466ff41a8c6d7d32d5fb4b1609463d99084b0c13d3036a'
            '63a77fa53b01b17aac60584531f4c05b462d36fef3996c333326a372dd6d6b39')

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
