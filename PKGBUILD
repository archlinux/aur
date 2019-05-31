# Maintainer: Alberto Fanjul <albertofanjul@gmail.com>
pkgname=sqlworkbenchj
pkgver=125
pkgrel=2
pkgdesc="SQL Workbench/J is a free, DBMS-independent, cross-platform SQL query tool."
arch=('i686' 'x86_64')
url="https://www.sql-workbench.eu"
license=('Apache 2.0')
makedepends=('unzip')
depends=('java-runtime')
arch=('i686' 'x86_64')
source=(https://www.sql-workbench.eu/Workbench-Build$pkgver-with-optional-libs.zip $pkgname sqlwbconsole $pkgname.desktop)
noextract=(Workbench-Build$pkgver-with-optional-libs.zip)
install=$pkgname.install
sha256sums=('fc7363c2740dee185ec50652366970bc156fe9ac229fb02628cb01c616525ff0'
            '3df27aa4b0f6256684754368672a0a8ee958b16d278b6a52942d30e33e098e95'
            '1841f20a20af9122fb00154f900672eeb523af7fa4232b71f32bfeac33bcde38'
            '793369646fcc4430dcc315bfb98c2405aa7f756f8168d8967dbbe4fb01a934a0')
prepare() {
  rm -rf $srcdir/content
  unzip -d $srcdir/content $srcdir/Workbench-Build$pkgver-with-optional-libs.zip
}

package() {

  content=$srcdir/content

  # Create directories
  install -d $pkgdir/usr/share/java/$pkgname/{,ext,manual/images,xslt}

  # Create startup script
  install -Dm755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname
  install -Dm755 $srcdir/sqlwbconsole $pkgdir/usr/bin/sqlwbconsole

  install $content/*.* $pkgdir/usr/share/java/$pkgname/
  install $content/ext/*.* $pkgdir/usr/share/java/$pkgname/ext
  install $content/manual/*.* $pkgdir/usr/share/java/$pkgname/manual
  install $content/manual/images/*.* $pkgdir/usr/share/java/$pkgname/manual/images
  install $content/xslt/*.* $pkgdir/usr/share/java/$pkgname/xslt

  # Create desktop and icon
  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644 $content/workbench32.png $pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png
}

