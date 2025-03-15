# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="jailer"
pkgver=16.5.9
pkgrel=1
pkgdesc="Database Subsetting and Relational Data Browsing Tool"
url="https://github.com/Wisser/Jailer"
license=("Apache")
arch=("x86_64")
depends=("java-runtime>=8")
source=("$pkgname-$pkgver.deb::$url/releases/download/v$pkgver/jailer-database-tools_$pkgver-x64.deb")
b2sums=('19e143aa8a8eb4099db3e5642d678a55a692aa5009c85f58bb3353b2838c328ff03ccffc876f8dae15da6c907dc938fb688f50feb0cbbec068cd598757c844e7')

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
