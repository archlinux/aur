# Contributor: Sebastian Wolf <swolf at melonkru dot de>
pkgname=advancemenu
pkgver=2.8
pkgrel=1
pkgdesc="A frontend for AdvanceMAME, AdvanceMESS and any other emulator"
arch=('i686' 'x86_64')
url="http://www.advancemame.it/menu-readme.html"
optdepends=('advancemame' 'sdlmame' 'sdlmess')
license=('GPL')
source=("https://github.com/amadvance/advancemame/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('554bf0fd05648db57080d71d59b104ec')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  # Binary
  install -D -m755 obj/menu/linux/blend/advmenu $pkgdir/usr/bin/advmenu
  # Manpage
  install -D -m644 doc/advmenu.1 $pkgdir/usr/share/man/man1/advmenu.1
  # Documentation
  install -D -m644 doc/advmenu.txt $pkgdir/usr/share/doc/advmenu/advmenu.txt
}
