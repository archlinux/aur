# Maintainer: Carson Rueter <roachh@protonmail.com>

pkgname='denise'
pkgdesc='Highly accurate C64/Amiga emulator'
url='https://sourceforge.net/projects/deniseemu/'
license=('GPL')
pkgver=2.1
pkgrel=1
_commit=8c4586513067
_srcdir="piciji-denise-$_commit"
source=("https://bitbucket.org/piciji/denise/get/v$pkgver.tar.gz")
sha256sums=('a44f7d3d4468b08cb2c77dd3061f8870d2794715f7590b0a1750b1ccd49d1f83')
provides=('denise')
conflicts=('denise-bin' 'denise-git')
depends=('sdl2' 'gtk3' 'openal' 'libpulse')
arch=('i686' 'x86_64')

prepare() {
  sed -i 's/Exec=Denise/Exec=denise/g' "$srcdir/$_srcdir/data/denise.desktop"
}

build() {
  cd "$srcdir/$_srcdir"
  make
}

package() {
  cd "$srcdir/$_srcdir"
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/icons/
  mkdir -p $pkgdir/usr/share/applications/
  mkdir -p $pkgdir/usr/lib/$pkgname/translation/
  mkdir -p $pkgdir/usr/lib/$pkgname/data/
  mkdir -p $pkgdir/usr/lib/$pkgname/fonts/
  mkdir -p $pkgdir/usr/lib/$pkgname/img/
  mkdir -p $pkgdir/usr/lib/$pkgname/shader/

  install -Dm755 out/denise $pkgdir/usr/bin/$pkgname
  install -Dm644 data/img/$pkgname.png $pkgdir/usr/share/icons/$pkgname.png
  install -Dm644 data/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644 data/translation/* $pkgdir/usr/lib/$pkgname/translation
  install -Dm644 data/data/* $pkgdir/usr/lib/$pkgname/data
  install -Dm644 data/fonts/*.ttf $pkgdir/usr/lib/$pkgname/fonts
  install -Dm644 data/img/bundle/* $pkgdir/usr/lib/$pkgname/img
  cp -r data/shader $pkgdir/usr/lib/$pkgname/
}

