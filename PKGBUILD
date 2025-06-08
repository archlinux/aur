# Maintainer: renyuneyun <renyuneyun at gmail dot com>
# Maintainer: Mikołaj Chwalisz <chwalisz at tkn dot tu-berlin dot de>

pkgname=jfed
_pkgname=jFed
pkgver=6.4.7
pkgrel=2
pkgdesc="jFed is a Java-based framework  for testbed federation"
arch=('x86_64')
url="http://jfed.iminds.be/"
license=('MIT')
depends=('java-openjfx>=14')
options=('!emptydirs' '!strip')
#install=$pkgname.install
source=(
    "http://jfed.iminds.be/downloads/stable/installers/${_pkgname}_linux_${pkgver//./_}.deb"
    "jFed-Experimenter.desktop"
    )
md5sums=('8be5ecc5206e9b2a2d0bb5ed0bd6c47e'
         '9e73fa7a04bf623897057e402f6ac5c6')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.gz -C "$pkgdir/"
  msg2 "Moving stuff in place..."
  chmod 444 $pkgdir/opt/jFed/.install4j/i4jempty.ttf

  install -d $pkgdir/{usr/{bin,share/applications},opt}
  install -d $pkgdir/opt

  ln -s /opt/jFed/jFed-Experimenter $pkgdir/usr/bin/jFed-Experimenter
  ln -s /opt/jFed/jFed-Automated-Tester $pkgdir/usr/bin/jFed-Automated-Tester
  ln -s /opt/jFed/jFed-Probe $pkgdir/usr/bin/jFed-Probe
  install -m644 $srcdir/jFed-Experimenter.desktop $pkgdir/usr/share/applications/
}
