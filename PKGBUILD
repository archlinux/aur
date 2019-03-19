# Maintainer: Matej Lach <matej.lach@gmail.com>
# Contributor: kitech1 <vatic@vivaldi.net>
pkgname=edrawmax
pkgver=9.3
pkgrel=2
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
options=(!strip)
install=
changelog=
source=(https://www.edrawsoft.com/archives/$pkgname-$pkgmaver-amd64.tar.gz)
sha256sums=('4ddc489dad1cd663a85ac91b5fe9c3263ae58aedbbcaaa690d7737d9b53e68eb')
noextract=()

prepare() {
  line=37  # head -n 3 file.run to get the line
  echo "Unpack bash binary..."
  ls -al
  tail -n +$line $pkgname-$pkgmaver-64.run > $pkgname-$pkgver.tar.gz
  rm -f $pkgname-$pkgmaver-64.run
}

build() {
  echo "Extracting files..."
  tar zxf $pkgname-$pkgmaver-amd64.tar.gz
  rm -f $pkgname-$pkgmaver-amd64.tar.gz
}

check() {
  cd "$srcdir/$pkgmaname-$pkgmaver"
}

package() {
  cd "$srcdir/$pkgmaname-$pkgmaver"
  mkdir -p "$pkgdir/opt/$pkgmaname-$pkgmaver"
  mv * "$pkgdir/opt/$pkgmaname-$pkgmaver/"

  cd "$pkgdir/opt/$pkgmaname-$pkgmaver"

  mkdir -p $pkgdir/usr/share/icon/
  mkdir -p $pkgdir/usr/share/applications/
  mkdir -p $pkgdir/usr/share/mime/packages/
  mkdir -p $pkgdir/usr/share/icons/gnome/scalable/mimetypes/
  mkdir -p $pkgdir/usr/bin/
  cp -f edrawmax.png $pkgdir/usr/share/icons/
  cp -f edrawmax.desktop $pkgdir/usr/share/applications/
  cp -f edrawmax.xml $pkgdir/usr/share/mime/packages/
  cp -f eddx.svg $pkgdir/usr/share/icons/gnome/scalable/mimetypes/
  ln -f -s /opt/$pkgmaname-$pkgmaver/$pkgmaname $pkgdir/usr/bin/edrawmax

  mv "lib" "lib.bak"
  mkdir -p lib
  cp -a ./lib.bak/libqtitanribbon.so* ./lib/
  cp -a ./lib.bak/libBaseCore.so* ./lib/
  cp -a ./lib.bak/libedgraphics.so* ./lib/
  cp -a ./lib.bak/libObjectModule.so* ./lib/
  cp -a ./lib.bak/libOSSC.so* ./lib/
  cp -a ./lib.bak/libImporter.so* ./lib/
  cp -a ./lib.bak/libExporter.so* ./lib/

  rm -fr ./lib.bak
  rm -f qt.conf
  rm -fr plugins
  # rm -fr library sample  # big directory, uncomment for test
}

# vim:set ts=2 sw=2 et:
