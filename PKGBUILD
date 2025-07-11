# Maintainer: Sterophonick

pkgname=winarcadia-bin
_pkgname='winarcadia-bin'
pkgver=34.41
pkgrel=2
pkgdesc='Emulator/Debugger of various Signetics 2650 game consoles'
url='https://amigan.1emu.net/releases'
arch=(x86_64 i686)
depends=('wine')
makedepends=(p7zip)
source=(https://amigan.1emu.net/releases/WinArcadia-bin.rar
        winarcadia
        winarcadia.desktop
        winarcadia.png)
noextract=(WinArcadia-bin.rar) # makepkg sucks at rars
md5sums=('SKIP' # this program is updated REALLY often :sob:
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
  curl -sS https://amigan.1emu.net/releases/ | grep -Po "(?<=WinArcadia )(.*)(?= \(Windows)"
}

prepare() {
  mkdir -p $srcdir/zip
  7z x WinArcadia-bin.rar -o$srcdir/zip
}

package() {
  cd $srcdir
  install -Dm755 winarcadia $pkgdir/usr/bin/winarcadia
  install -Dm644 winarcadia.desktop $pkgdir/usr/share/applications/winarcadia.desktop
  install -Dm644 winarcadia.png $pkgdir/usr/share/pixmaps/winarcadia.png

  mkdir -p $pkgdir/usr/share/winarcadia/
  cp -r zip/* $pkgdir/usr/share/winarcadia
  chmod -R 777 $pkgdir/usr/share/winarcadia
}
