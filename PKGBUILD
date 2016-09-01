# Maintainer: Johannes Pohl <johannes.pohl90@gmail.com>
pkgname=urh
license=('Apache')
pkgver=1.0.8
pkgrel=1
pkgdesc="Universal Radio Hacker - Hacking wireless protocols made easy"
arch=('i686' 'x86_64')
url="https://github.com/jopohl/urh"
depends=('python>=3.4' 'python-pyqt5' 'python-numpy')
makedepends=('gcc')
optdepends=(
  'hackrf: for native hackrf backend'
  'gnuradio: for USRP gnuradio backend'
  'gnuradio-osmosdr: for more gnuradio device backends (HackRF, FunCubeDongle, RTL-SDR)'
)

source=($pkgname-$pkgver.tar.gz::https://github.com/jopohl/urh/tarball/v$pkgver)
md5sums=('9410c333e3253c454535a0d6429ba248')
sha256sums=('28cf575df1b166eaa6a58c8e195d8cb27afae86e32670aee7a1088216ab8fe78')

build() {
  cd "$srcdir"
  mv jopohl* "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  msg 'Building C++ extensions...'
  python setup.py build_ext
  msg 'successfully built C++ extensions'
}


package() {
  cd "$srcdir/$pkgname-$pkgver/"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 urh.desktop "${pkgdir}/usr/share/applications/urh.desktop"
  install -Dm644 ./data/icons/appicon.png "${pkgdir}/usr/share/pixmaps/urh.png"
  install -Dm644 README.md "${pkgdir}/usr/share/docs/${pkgname}/README.md"
}

