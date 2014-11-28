# Contributor: Dragonlord <dragonlord@aur.archlinux.org>

pkgname=bitext2tmx
pkgver=1.0M0
pkgrel=4
pkgdesc="Generate a TMX translation memory for use in computer-assisted translation."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/bitext2tmx"
license=('GPL')
depends=('java-runtime' 'desktop-file-utils')
install=$pkgname.install
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver-080229.7z \
        $pkgname.desktop)
sha256sums=('a1dba2de5fa5a3477fdc591d298f50e1c2494197830c7ab2cf5a4681487837d5'
            '280b35dbf4002f76c963bb2cdb979efba0f7bbf43e6d4d311ec5846ebecfa289')

package() {
  cd "${srcdir}/$pkgname-$pkgver-080229"
  install -d "${pkgdir}/usr/share/java/$pkgname" "${pkgdir}/usr/bin"
  rm $pkgname.bat

  cp -r ${srcdir}/$pkgname-$pkgver-080229/* "${pkgdir}/usr/share/java/$pkgname"
  find ${pkgdir}/usr/share/java/$pkgname -type f -exec chmod 644 "{}" \;

# executable file
  echo "#!/bin/bash" > "${pkgdir}/usr/bin/$pkgname.sh"
  echo "cd /usr/share/java/$pkgname/" >> "${pkgdir}/usr/bin/$pkgname.sh"
  echo "java -jar $pkgname-$pkgver-080229.jar \$*" >> "${pkgdir}/usr/bin/$pkgname.sh"
  chmod 755 "${pkgdir}/usr/bin/$pkgname.sh"

# .desktop file + icon
  install -D -m644 "${srcdir}/$pkgname.desktop" \
    "${pkgdir}/usr/share/applications/$pkgname.desktop"
  install -D -m644 ${srcdir}/$pkgname-$pkgver-080229/doc/resources/b2t.png \
    "${pkgdir}/usr/share/pixmaps/$pkgname.png"
}
