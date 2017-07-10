# Maintainer: Wes Barnett <wes at wbarnett dot us>
pkgname=anki
pkgver=2.1.0beta2
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
sha512sums=('8e72e51dd05af41c363ecaff89e313ceb83b9ddfaafedb64b65faa6a51ad621e752be6617101cd791cc986d72bb16c61f6e4bd629bb0a707a6cc0b22246f4f78')

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
