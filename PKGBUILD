# PKGBUILD: 2012-12-16
# Maintainer:  Alex Zbarcea <alexz at apache dot org>

pkgname=elephant
pkgver=59
pkgrel=1
pkgdesc="Notetaker with a classic interface."
url="http://elephant.mine.nu/"
arch=('any')
license=('Apache')
depends=('java-environment' 'bash')
#conflicts=('none')
source=(https://github.com/jusu/Elephant/releases/download/V"$pkgver"/elephant"$pkgver"_jar.zip)
sha256sums=('ce9364be1c1a9b84dbbe6fce15b9dc8fc282b974bf8bf03f3361315e0929bd15')

package() {
    cd "$pkgdir"

    install -D -m644 $srcdir/elephantapp.jar $pkgdir/usr/share/java/$pkgname/elephantapp.jar

    mkdir -p $pkgdir/usr/bin
    cat << EOF > $pkgdir/usr/bin/elephant
#!/bin/bash
exec java -jar /usr/share/java/$pkgname/elephantapp.jar "\$@"
EOF
  chmod 755 $pkgdir/usr/bin/elephant

  mkdir -p $pkgdir/usr/share/applications
  cat << EOF > $pkgdir/usr/share/applications/elephant.desktop
[Desktop Entry]
Comment=${pkgdesc}
Terminal=false
Name=Elephant
Exec=/usr/bin/elephant
Type=Application
Categories=Office;Accessories
EOF
  chmod 644 $pkgdir/usr/share/applications/elephant.desktop
}
