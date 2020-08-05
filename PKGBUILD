# Maintainer: picokan <todaysoracle@protonmail.com>

pkgname=st-sane-defaults
_pkgname=st
pkgver=0.8.2
pkgrel=1
pkgdesc='A simple virtual terminal emulator for X.'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=(libxft)
url=https://st.suckless.org
source=(https://dl.suckless.org/$_pkgname/$_pkgname-$pkgver.tar.gz
		sane-defaults-patch.diff
		st-sane-defaults.desktop)
sha256sums=('aeb74e10aa11ed364e1bcc635a81a523119093e63befd2f231f8b0705b15bf35'
			SKIP SKIP)
provides=("st")
conflicts=("st")

prepare() {
  patch -d "$srcdir/$_pkgname-$pkgver" < sane-defaults-patch.diff
}

build() {
  cd $srcdir/$_pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 st.info $pkgdir/usr/share/$pkgname/st.info
  cd ..
  install -Dm644 st-sane-defaults.desktop $pkgdir/usr/share/applications/st-sane-defaults.desktop
}
