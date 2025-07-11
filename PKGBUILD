# Maintainer: Sterophonick

pkgname=nocashgba-debugger
_pkgname='nocashgba-debugger'
pkgver=3.06
pkgrel=2
pkgdesc='Game Boy Advance / Nintendo DS debugger and emulator'
arch=(x86_64 i686)
depends=('wine' 'winetricks')
makedepends=('p7zip')
source=(https://problemkaputt.de/no\$gba.zip
        nocashgba-debugger
        nocashgba-debugger.desktop
        nocashgba-debugger.png)
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP')
noextract=(no\$gba.zip)

pkgver() {
  curl -Ss https://problemkaputt.de/gba.htm | grep -Po "(?<=- no\\\$gba v)(.*)(?= -)"
}

prepare() {
  cd $srcdir
  mkdir -p nocash
  7z x no\$gba.zip -aou -onocash
}

package() {
  install -Dm755 nocashgba-debugger $pkgdir/usr/bin/nocashgba-debugger
  install -Dm644 nocashgba-debugger.desktop $pkgdir/usr/share/applications/nocashgba-debugger.desktop
  install -Dm644 nocashgba-debugger.png $pkgdir/usr/share/pixmaps/nocashgba-debugger.png

  mkdir -p $pkgdir/usr/share/nocashgba-debugger

  cp -r $srcdir/nocash/* $pkgdir/usr/share/nocashgba-debugger
  chmod -R 777 $pkgdir/usr/share/nocashgba-debugger
}
