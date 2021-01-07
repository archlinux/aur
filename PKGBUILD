# Maintainer: qeeg <mszoopers@protonmail.com>

pkgname=lib32-86box-nightly-bin
pkgver=3.0.git
pkgrel=1
pkgdesc="x86 full-system emulator running via Wine"
arch=('x86_64')
url="http://86box.net"
license=('GPL2')
depends=('wine' 'winetricks')
source=(
  86box.desktop
  86box.sh
  https://ci.86box.net/job/86Box/lastSuccessfulBuild/artifact/*zip*/archive.zip
)
provides=("86box")
conflicts=("86box")

options=(!strip)

build() {
  cd $srcdir/
  cd archive
  bsdtar -x -f 86Box-32-*.zip
}

package() {
  cd $srcdir/archive
  install -d -m755 $pkgdir/usr/share/86box
  install -m755 86Box.exe $pkgdir/usr/share/86box
  install -m644 discord_game_sdk.dll $pkgdir/usr/share/86box
  install -m644 freetype.dll $pkgdir/usr/share/86box
  install -m644 gsdll32.dll $pkgdir/usr/share/86box
  install -m644 libfluidsynth.dll $pkgdir/usr/share/86box
  install -d -m755 $pkgdir/usr/bin
  cd ..
  install -m755 86box.sh $pkgdir/usr/bin
  install -d -m755 $pkgdir/usr/share/applications
  install -m644 86box.desktop $pkgdir/usr/share/applications
  find $pkgdir/usr/share/86box/ -type f -exec chmod 644 {} \;
  find $pkgdir/usr/share/86box/ -type f -exec chmod 755 {} \;
}

post_install() {
  echo "You will need to download an 86Box romset yourself. This is available at https://github.com/86Box/roms"
}

md5sums=('91806130ae51196094ec77f2a7b4ce3e'
'2f6edbb5b672676a59bc689aaab0e043'
'SKIP')