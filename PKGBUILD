# Maintainer: Sebba <sebba at cock dot li>
pkgname=arena-tracker-git
_pkgname=arena-tracker
pkgver=r316.5673638
pkgrel=1
pkgdesc="Hearthstone tool to track cards in Arena."
arch=(x86_64)
url="https://github.com/supertriodo/Arena-Tracker/"
license=('GPL')
depends=('opencv' 'qt5-base')
provides=('arena-tracker-git' 'arena-tracker')
conflicts=('arena-tracker')
source=("$pkgname::git+https://github.com/supertriodo/Arena-Tracker.git"
		"$_pkgname.desktop"
    "$_pkgname")
md5sums=('SKIP'
         '0cd0e29ef6149a79090ce37541bd58a4'
         '20f58f8c0b7a6ea5fbee0c2d641e8ddb')
install=$_pkgname.install

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	qmake .
	make
}

package() {
  cd "$srcdir/$pkgname/"
  install -d -m 766 ${pkgdir}/opt/${_pkgname}/HSCards
  install -d -m 755 ${pkgdir}/usr/share/doc/${_pkgname}
  install -D -m 755 ArenaTracker ${pkgdir}/opt/${_pkgname}/ArenaTracker
  install -D -m 644 ArenaTracker.ico $pkgdir/usr/share/pixmaps/ArenaTracker.ico
  cp -R HSCards ${pkgdir}/opt/${_pkgname}/
  install -D -m 644 $srcdir/$_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop
  install -D -m 755 $srcdir/$_pkgname $pkgdir/usr/bin/$_pkgname
  install -D -m 644 Fonts/hsFont.ttf $pkgdir/usr/share/fonts/TTF/hsFont.ttf
  install -D -m 644 README.md ${pkgdir}/usr/share/doc/${_pkgname}
}
