# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="jailer"
pkgver=16.9
pkgrel=1
pkgdesc="Database Subsetting and Relational Data Browsing Tool"
url="https://github.com/Wisser/Jailer"
license=("Apache-2.0")
arch=("x86_64")
depends=("java-runtime>=8")
source=("$pkgname-$pkgver.deb::$url/releases/download/v$pkgver/jailer-database-tools_$pkgver-x64.deb")
b2sums=('60e11ade6045721153c9004173605666b60863fba0394a8008a9221c6a0070445a07481ffd81fd21b6f89ab3a8685923d91514985116233bcdcbae4025ffd4bb')

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
