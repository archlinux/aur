pkgname=anki
pkgver=2.1.0a13
alpha=13
pkgrel=2
pkgdesc="Helps you remember facts (like words/phrases in a foreign language) efficiently"
url="https://ankisrs.net/"
license=('AGPL3')
arch=('x86_64')
depends=('python-pyqt5' 'python-pyaudio' 'python-requests' 'python-beautifulsoup4'
'python-send2trash' 'python-httplib2' 'mplayer' 'lame')
checkdepends=('python-nose' 'python-coverage')
source=(https://apps.ankiweb.net/downloads/alpha/alpha$alpha/$pkgname-$pkgver-source.tgz
Makefile)
sha512sums=('5a6055f3cf08a19a86843068135ea7034ee28bebb4c71453033c7e9a8f7e8e0281f4faca14f61debd16f0faad2cf6ba8c420a12d207ae380bfc3f282d9a2b0ba'
            '1139f4a1384194521517295768bbc42f32a801e93c294910d375eb5b55fa018f7d0bd40c5031c20fd891954aa54c4fd18a3fa16e75ed52de1c31ef8ab1f00fd0')

prepare() {
  cp Makefile $srcdir/$pkgname-$pkgver
  cd $srcdir/$pkgname-$pkgver
  sed -i '/xdg-mime/d' Makefile
  head -n -5 aqt/qt.py > tmp
  mv tmp aqt/qt.py
}

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
  make DESTDIR=$pkgdir PREFIX=/usr install
}
