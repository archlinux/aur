# PKGBUILD: 2018-10-02
# Maintainer:  Thayne McCombs <astrothayne at gmail dot com>

pkgname=elephant
pkgver=50
pkgrel=1
pkgdesc="Notetaker with a classic interface."
url="http://elephant.mine.nu/"
arch=('any')
license=('Apache')
depends=('java-environment' 'bash')
source=(https://github.com/jusu/Elephant/releases/download/V"$pkgver"/elephant"$pkgver"_jar.zip)
sha256sums=('e461c387352335ab03a819017bf74ff5ed8611a1f7fed395976962a8c3949de8')

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
