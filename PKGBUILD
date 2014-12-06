# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=backdup
pkgver=0.1
pkgrel=1
pkgdesc="Duplicity front-end"
arch=('any')
url="http://backdup.sourceforge.net"
license=('GPL3')
depends=('java-runtime' 'duplicity')
source=(http://sourceforge.net/projects/$pkgname/files/$pkgname.tar.bz2
        $pkgname.desktop)
sha256sums=('0462e1f64c85be6f05bb419895506edcb609ea7d85dd52db2a44f3616e6dca04'
            '362a5275cea56b036969a5da70c729b1723b950744de4826ec990dcce2b27fb8')

package() {
  cd "${srcdir}"

  install  -Dm644 $pkgname.jar "${pkgdir}"/usr/share/java/$pkgname/$pkgname.jar

#.desktop file + icon
  install -D -m644 "${srcdir}"/$pkgname.desktop \
    "${pkgdir}"/usr/share/applications/$pkgname.desktop
  install -D -m644 "${srcdir}"/$pkgname.png \
    "${pkgdir}"/usr/share/pixmaps/$pkgname.png

#executable file
  install -d "${pkgdir}"/usr/bin
  echo "#!/bin/bash" > "${pkgdir}"/usr/bin/$pkgname
  echo "java -jar /usr/share/java/backdup/backdup.jar" >> "${pkgdir}"/usr/bin/$pkgname
  chmod +x "${pkgdir}"/usr/bin/$pkgname
}
