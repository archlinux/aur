# Maintainer: Carson Rueter <roachh@protonmail.com>

pkgname='denise'
pkgdesc='Highly accurate C64/Amiga emulator'
url='https://sourceforge.net/projects/deniseemu/'
license=('GPL')
pkgver=1.1.3.1
pkgrel=1
_commit=c592258703c8
_srcdir="piciji-denise-$_commit"
source=("https://bitbucket.org/piciji/denise/get/v$pkgver.tar.gz")
sha256sums=('665da9925cbce7c675127f3370435ba6ed23c9e23bb7dd1dfb699f9f0da9f987')
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

