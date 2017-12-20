# Contributor: chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'

pkgname=cemu
pkgver=1.11.2
pkgrel=3
pkgdesc="Wii U emulator (via wine). Includes the Cemuhook plugin and graphic packs"
arch=(x86_64)
url="http://cemu.info/"
license=('custom')
depends=('wine')
source=(
  cemu.sh
  cemu.xpm
  cemu.desktop
  http://cemu.info/releases/cemu_1.11.2.zip
  https://files.sshnuke.net/cemuhook_1112_0554.zip
  https://github.com/slashiee/cemu_graphic_packs/releases/download/appveyor521/graphicPacks_2-521.zip
)
noextract=('cemuhook_1112_0554.zip'
           'graphicPacks_2-521.zip')
install=${pkgname}.install

md5sums=('01118cf3e1ef9e453b5c56d2d27f6967'
         '54d70005a8975812ab54fcfef53f7bde'
         '9ca016ad209689c61d7a9ff8df4dd371'
         'bc180c58791ed4294293478e08408f3d'
         '5ad039a6542cbbe89d2cb94901f64d46'
         '48a3a55be834e5cda0c64bdf4fbce253')

options=(!strip)

build() {
  cd $srcdir/
  cd cemu$pkgver
  bsdtar -x -f ../../cemuhook_1112_0554.zip
  cd graphicPacks
  bsdtar -x -f ../../../graphicPacks_2-521.zip
}
package() {
  cd $srcdir
  install -d -m755 $pkgdir/usr/share/
  install -d -m755 $pkgdir/usr/share/$pkgname
  install -d -m755 $pkgdir/usr/bin
  install -m755 cemu.sh $pkgdir/usr/bin/$pkgname
  install -d -m755 $pkgdir/usr/share/applications
  install -d -m755 $pkgdir/usr/share/pixmaps
  install -m644 cemu.desktop $pkgdir/usr/share/applications
  install -m644 cemu.xpm $pkgdir/usr/share/pixmaps/cemu.xpm
  cd cemu$pkgver
  install -m644 Cemu.exe $pkgdir/usr/share/$pkgname
  install -m644 dbghelp.dll $pkgdir/usr/share/$pkgname
  install -m644 keystone.dll $pkgdir/usr/share/$pkgname
  cp -R gameProfiles $pkgdir/usr/share/$pkgname
  cp -R graphicPacks $pkgdir/usr/share/$pkgname
  cp -R hfiomlc01 $pkgdir/usr/share/$pkgname
  cp -R mlc01 $pkgdir/usr/share/$pkgname
  cp -R shaderCache $pkgdir/usr/share/$pkgname
  find $pkgdir/usr/share/$pkgname -type f -exec chmod 644 {} \;
  find $pkgdir/usr/share/$pkgname -type d -exec chmod 755 {} \;
}

