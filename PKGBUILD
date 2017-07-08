# PKGBUILD: 08-jul-2017
# Maintainer:  Bas Ammerlaan <bas at bammerlaan dot nl>

pkgname=elephant
pkgver=34
pkgrel=1
pkgdesc="Notetaker with a classic interface."
url="http://elephant.mine.nu/"
arch=('any')
license=('Apache')
depends=('java-environment' 'bash')
#install='cgoban3.install'
source=(https://github.com/jusu/Elephant/releases/download/v"$pkgver"/elephant"$pkgver"_jar.zip)
#noextract=('cgoban.jar')
md5sums=('f5a7d9a54a70f410f7097a7ac64deb67')

package() {
    cd "$pkgdir"
    #destdir=$"pkgdir"/usr/share/java/$"pkgname"
    
    mkdir -p $pkgdir/usr/share/java/$pkgname
    
    unzip -o -d "$srcdir" "$srcdir/elephant${pkgver}_jar.zip"
    
    mkdir -p $pkgdir/usr/bin
    
	cat << EOF > $pkgdir/usr/bin/elephant
#!/bin/bash
cd /usr/share/java/$pkgname && java -jar elephantapp.jar "\$@"
EOF
	chmod a+x $pkgdir/usr/bin/elephant
    
    install -m644 $srcdir/elephantapp.jar $pkgdir/usr/share/java/$pkgname/elephantapp.jar
    
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

}
