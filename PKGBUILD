pkgname=anki
pkgver=2.1.0a15
alpha=15
pkgrel=2
pkgdesc="WARNING: THIS BUILDS ALPHA SOFTWARE. Friendly, intelligent flash cards"
url="https://ankisrs.net/"
license=('AGPL3')
arch=('any')
depends=('python-pyqt5' 'python-pyaudio' 'python-requests' 'python-beautifulsoup4'
'python-send2trash' 'python-httplib2' 'qt5-webengine')
checkdepends=('python-nose' 'python-coverage' 'texlive-core')
optdepends=('lame: record sound'
            'mplayer: play sound'
            'texlive-core: use latex markup')
source=(https://apps.ankiweb.net/downloads/alpha/alpha$alpha/$pkgname-$pkgver-source.tgz)
sha512sums=('1ad41354be4a79e56f0f81e4e7e352d99120f04fcec4eb8c839a823d80a4800a5364190128988960d0218a3d68d9105463120334d16a182944e589f204641e4d')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./tools/build_ui.sh
}

check() {
  cd $srcdir/$pkgname-$pkgver
  coverage=1 ./tools/tests.sh
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -Dm755 tools/runanki.system $pkgdir/usr/bin/anki
  install -Dm644 anki.xpm anki.png -t $pkgdir/usr/share/pixmaps/
  install -Dm644 anki.desktop -t $pkgdir/usr/share/applications/
  install -Dm644 anki.1 -t $pkgdir/usr/share/man/man1/
  install -Dm644 README.md -t $pkgdir/usr/share/doc/anki/
  install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/anki/
  mkdir -p $pkgdir/usr/share/anki
  cp -ar anki $pkgdir/usr/share/anki/
  cp -ar aqt $pkgdir/usr/share/anki/
  cp -ar designer $pkgdir/usr/share/anki/
  cp -ar locale $pkgdir/usr/share/anki/
}
