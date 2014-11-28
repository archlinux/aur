# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=periodiccalendar
pkgver=3.2.0
pkgrel=1
pkgdesc="Periodic Calendar for tracking women cycle"
arch=('any')
url="http://linuxorg.sf.net/"
license=('GPL3')
depends=('java-runtime')
source=(http://downloads.sourceforge.net/project/linuxorg/PeriodicCalendar/pcalendar-3.2/pcalendar-$pkgver.jar \
        $pkgname.desktop \
        $pkgname.png)
md5sums=('5d82d158f3f3131f774ee954f03fffc7'
         '5b8490188ad00deea39cef729359d39d'
         'c26856c7a8a0045e8aa36f063563f67f')

build() {
  cd ${srcdir}

  install -D -m644 ${srcdir}/pcalendar-$pkgver.jar ${pkgdir}/usr/share/java/$pkgname/$pkgname.jar || return 1
  install -D -m644 ${srcdir}/$pkgname.png ${pkgdir}/usr/share/pixmaps/$pkgname.png || return 1
  install -D -m644 ${srcdir}/$pkgname.desktop ${pkgdir}/usr/share/applications/$pkgname.desktop || return 1

#creating executable file
  install -d ${pkgdir}/usr/bin
  echo "#!/bin/bash" > ${pkgdir}/usr/bin/$pkgname || return 1
  echo "java -jar /usr/share/java/$pkgname/$pkgname.jar" >> ${pkgdir}/usr/bin/$pkgname || return 1
  chmod 755 ${pkgdir}/usr/bin/$pkgname || return 1
}
