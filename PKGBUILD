pkgname=anki
pkgver=2.1.0a14
alpha=14
pkgrel=2
pkgdesc="Friendly, intelligent flash cards"
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
sha512sums=('95f8b905f699bb4fdbad19438182312f2373b58cdc2a839944b97a75a6e4b5cc73f897f444f5603c26776283b747da7c100d46b4ccea8731e7b462eca7681058')

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
