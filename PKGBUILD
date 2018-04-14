# Maintainer: kitech1 <vatic@vivaldi.net>
pkgname=edrawmax
pkgver=9.1
pkgrel=1
pkgmaver=9
pkgmaname=EdrawMax
epoch=
pkgdesc="All-in-One Diagram Software"
arch=('x86_64')
url="http://www.edrawsoft.cn/edrawmax/"
license=('custom:"Copyright EdrawSoft 2004-2018; All Rights Reserved."')
groups=()
depends=(qt5-base)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip !upx)
install=
changelog=
source=(http://www.edrawsoft.cn/2download/$pkgname-$pkgmaver-64-cn.run.tgz)
md5sums=('bba2467bde6c8a7339454460f7c18d23')
noextract=()

prepare() {
  line=37  # head -n 3 file.run to get the line
  echo "Unpack bash binary..."
  tail -n +$line $pkgmaname-$pkgmaver-64-cn.run > $pkgname-$pkgver.tar.gz
  rm -f $pkgmaname-$pkgmaver-64-cn.run
}

build() {
  echo "Extracting files..."
  tar zxf $pkgname-$pkgver.tar.gz
  rm -f $pkgname-$pkgver.tar.gz
}

check() {
  cd "$srcdir/$pkgmaname-$pkgmaver"
}

package() {
  cd "$srcdir/$pkgmaname-$pkgmaver"
  mkdir -p "$pkgdir/opt/$pkgmaname-$pkgmaver"
  mv * "$pkgdir/opt/$pkgmaname-$pkgmaver/"

  cd "$pkgdir/opt/$pkgmaname-$pkgmaver"
  rm -f "qt.conf"
  mv "lib" "lib.bak"
  rm -fr "plugins"

  mkdir -p $pkgdir/usr/share/icon/
  mkdir -p $pkgdir/usr/share/applications/
  mkdir -p $pkgdir/usr/share/mime/packages/
  mkdir -p $pkgdir/usr/share/icons/gnome/scalable/mimetypes/
  mkdir -p $pkgdir/usr/bin/
  cp -f edrawmax.png $pkgdir/usr/share/icons/
  cp -f edrawmax.desktop $pkgdir/usr/share/applications/
  cp -f edrawmax.xml $pkgdir/usr/share/mime/packages/
  cp -f eddx.svg $pkgdir/usr/share/icons/gnome/scalable/mimetypes/

  mkdir -p lib
  cp -a ./lib.bak/libqtitanribbon.so* ./lib/
  cp -a ./lib.bak/libBaseCore.so* ./lib/
  cp -a ./lib.bak/libedgraphics.so* ./lib/
  cp -a ./lib.bak/libObjectModule.so* ./lib/
  cp -a ./lib.bak/libOSSC.so* ./lib/
  cp -a ./lib.bak/libImporter.so* ./lib/
  cp -a ./lib.bak/libExporter.so* ./lib/

  rm -fr ./lib.bak
  # rm -fr library sample  # big directory, uncomment for test
}

# vim:set ts=2 sw=2 et:
