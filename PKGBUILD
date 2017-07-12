# Maintainer: Wes Barnett <wes at wbarnett dot us>
pkgname=anki
pkgver=2.1.0beta3
pkgrel=1
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
source=(https://apps.ankiweb.net/downloads/beta/$pkgname-$pkgver-source.tgz)
sha512sums=('d901effa5fac10a337f7073cc9ded2319b1c6677981439d013a46cf48c88ddc4b7f2c3af43c052c69f01aadbcebb647157e030a0d7e4e855f080525576698e9c')

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
