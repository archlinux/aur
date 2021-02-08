# Maintainer: Carson Rueter <roachh@protonmail.com>

pkgname='denise'
pkgdesc='Highly accurate C64/Amiga emulator'
url='https://sourceforge.net/projects/deniseemu/'
license=('GPL')
pkgver=1.0.9.1
pkgrel=1
_commit=b0719d48bd98
source=("https://bitbucket.org/piciji/denise/get/v$pkgver.tar.gz"
	'desktop_patch.patch')
md5sums=('cf054ced246fb269f743418b0c16a04c'
         'a2560751aa87c17c05c53fff051fcaf6')
provides=('denise')
conflicts=('denise-bin' 'denise-git')
depends=('sdl2' 'gtk3')
arch=('i686' 'x86_64')

prepare() {
  patch --binary -Np1 -i desktop_patch.patch
}

build() {
  cd "$srcdir/piciji-denise-$_commit"
  make
}

package() {
  cd "$srcdir/piciji-denise-$_commit"
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/icons/
  mkdir -p $pkgdir/usr/share/applications/
  mkdir -p $pkgdir/usr/lib/$pkgname/translation/
  mkdir -p $pkgdir/usr/lib/$pkgname/data/
  mkdir -p $pkgdir/usr/lib/$pkgname/fonts/
  mkdir -p $pkgdir/usr/lib/$pkgname/img/
  mkdir -p $pkgdir/usr/lib/$pkgname/shader/

  install -Dm755 out/Denise $pkgdir/usr/bin/$pkgname
  install -Dm644 data/img/$pkgname.png $pkgdir/usr/share/icons/$pkgname.png
  install -Dm644 data/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644 data/translation/* $pkgdir/usr/lib/$pkgname/translation
  install -Dm644 data/data/* $pkgdir/usr/lib/$pkgname/data
  install -Dm644 data/fonts/*.ttf $pkgdir/usr/lib/$pkgname/fonts
  install -Dm644 data/img/bundle/* $pkgdir/usr/lib/$pkgname/img
  cp -r data/shader $pkgdir/usr/lib/$pkgname/
}

