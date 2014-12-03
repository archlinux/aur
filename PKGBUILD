# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=bitext2tmx
pkgver=1.0M0.1
pkgrel=1
pkgdesc="Generate a TMX translation memory for use in computer-assisted translation"
arch=('any')
url="http://sourceforge.net/projects/bitext2tmx"
license=('GPL')
depends=('java-runtime' 'desktop-file-utils')
install=$pkgname.install
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname/1.0%20Milestone%200.1%20(M0.1)/$pkgname-$pkgver-140117.zip"
        $pkgname.desktop)
sha256sums=('91f424f2462a038ee986f902848b9145b04dc45b99693f9b83b4f47194285a3d'
            '280b35dbf4002f76c963bb2cdb979efba0f7bbf43e6d4d311ec5846ebecfa289')

package() {
  cd "${srcdir}"/$pkgname-$pkgver-140117
  install -d "${pkgdir}"/usr/share/java/$pkgname "${pkgdir}"/usr/bin
  rm $pkgname.bat

  cp -r "${srcdir}"/$pkgname-$pkgver-140117/* "${pkgdir}"/usr/share/java/$pkgname
  find "${pkgdir}"/usr/share/java/$pkgname -type f -exec chmod 644 "{}" \;

# executable file
  echo "#!/bin/bash" > "${pkgdir}"/usr/bin/$pkgname.sh
  echo "cd /usr/share/java/$pkgname/" >> "${pkgdir}"/usr/bin/$pkgname.sh
  echo "java -jar $pkgname-$pkgver-140117.jar \$*" >> "${pkgdir}"/usr/bin/$pkgname.sh
  chmod 755 "${pkgdir}"/usr/bin/$pkgname.sh

# .desktop file + icon
  install -Dm644 "${srcdir}"/$pkgname.desktop \
    "${pkgdir}"/usr/share/applications/$pkgname.desktop
  install -Dm644 "${srcdir}"/$pkgname-$pkgver-140117/doc/resources/b2t.png \
    "${pkgdir}"/usr/share/pixmaps/$pkgname.png
}
