# Maintainer: Sebba <sebba at cock dot li>
pkgname=arena-tracker-git
_pkgname=arena-tracker
pkgver=r312.b9ed1dc
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
    "$_pkgname.png"
    "$_pkgname")
md5sums=('SKIP'
         '7bde4d037053ab9616921207ed1ee573'
         '73bb2752670a27046eaf4d6d2d844632'
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
  install -d -m 755 ${pkgdir}/opt/${_pkgname}/
  install -d -m 775 ${pkgdir}/opt/${_pkgname}/HSCards
  install -d -m 755 ${pkgdir}/usr/share/doc/${_pkgname}
  install -D -m 755 ArenaTracker ${pkgdir}/opt/${_pkgname}/
  cp -R HSCards ${pkgdir}/opt/${_pkgname}/
  install -D -m 644 $srcdir/$_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop
  install -D -m 644 $srcdir/$_pkgname.png $pkgdir/usr/share/pixmaps/$_pkgname.png
  install -D -m 755 $srcdir/$_pkgname $pkgdir/usr/bin/$_pkgname
  install -D -m 644 Fonts/hsFont.ttf $pkgdir/usr/share/fonts/TTF/hsFont.ttf
  install -D -m 644 README.md ${pkgdir}/usr/share/doc/${_pkgname}
}
