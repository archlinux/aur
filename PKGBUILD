# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="jailer"
pkgver=16.7.1
pkgrel=1
pkgdesc="Database Subsetting and Relational Data Browsing Tool"
url="https://github.com/Wisser/Jailer"
license=("Apache")
arch=("x86_64")
depends=("java-runtime>=8")
source=("$pkgname-$pkgver.deb::$url/releases/download/v$pkgver/jailer-database-tools_$pkgver-x64.deb")
b2sums=('0bccc8ae9d9b869452cc19101d11ef10a045906fb320ce067dbc9606114f5610905fb07ad60a749bde7cdbd8664ec4df12a4ac13d3bebf5b11ed297225270749')

prepare(){
 tar -xf "data.tar.zst"
 sed -i "opt/jailer-database-tools/lib/jailer-database-tools-Jailer_Database_Tools.desktop" \
     -e "s|Icon=.*|Icon=jailer|"
}

package(){
 install -d "$pkgdir/usr"
 # not putting executables in /usr/bin because they require ../lib/app/jailer.cfg
 install -D -m 644 "opt/jailer-database-tools/lib/jailer-database-tools-Jailer_Database_Tools.desktop" "$pkgdir/usr/share/applications/jailer.desktop"
 install -D -m 644 "opt/jailer-database-tools/lib/Jailer_Database_Tools.png" "$pkgdir/usr/share/pixmaps/jailer.png"
 install -D -m 644 "opt/jailer-database-tools/share/doc/copyright" "$pkgdir/usr/share/licenses/jailer/LICENSE"
 cp -r "opt" "$pkgdir"
}
