# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="jailer"
pkgver=12.0
pkgrel=1
pkgdesc="Database Subsetting and Relational Data Browsing Tool"
url="https://github.com/Wisser/Jailer"
license=("Apache")
arch=("x86_64")
depends=("java-runtime>=8")
source=("$pkgname-$pkgver.deb::$url/releases/download/v$pkgver/jailer-database-tools_$pkgver-x64.deb")
sha256sums=('b3683873604e7bd5382ede3f38fbb5200a6c3587fd2d5bdb873ccedd426810ac')

prepare(){
 tar -xf "data.tar.xz"
 sed -i "opt/jailer-database-tools/lib/jailer-database-tools-Jailer.desktop" \
     -e "s|Icon=.*|Icon=jailer|"
 sed -i "opt/jailer-database-tools/lib/jailer-database-tools-Jailer_Data_Browser.desktop" \
     -e "s|Icon=.*|Icon=jailer|"
}

package(){
 install -d "$pkgdir/usr"
 # not putting executables in /usr/bin because they require ../lib/app/jailer.cfg
 install -D -m 644 "opt/jailer-database-tools/lib/jailer-database-tools-Jailer.desktop" "$pkgdir/usr/share/applications/jailer.desktop"
 install -D -m 644 "opt/jailer-database-tools/lib/jailer-database-tools-Jailer_Data_Browser.desktop" "$pkgdir/usr/share/applications/jailer_data_browser.desktop"
 install -D -m 644 "opt/jailer-database-tools/lib/Jailer.png" "$pkgdir/usr/share/pixmaps/jailer.png"
 install -D -m 644 "opt/jailer-database-tools/share/doc/copyright" "$pkgdir/usr/share/licenses/jailer/LICENSE"
 cp -r "opt" "$pkgdir"
}
