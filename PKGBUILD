# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="jailer"
pkgver=12.5
pkgrel=1
pkgdesc="Database Subsetting and Relational Data Browsing Tool"
url="https://github.com/Wisser/Jailer"
license=("Apache")
arch=("x86_64")
depends=("java-runtime>=8")
source=("$pkgname-$pkgver.deb::$url/releases/download/v$pkgver/jailer-database-tools_$pkgver-x64.deb")
sha256sums=('ccad91814ca5e1366a195fa6ddb018ffefc6cedeb3d32913111d78bda17d6431')

prepare(){
 tar -xf "data.tar.xz"
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
