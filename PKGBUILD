# Maintainer: Johannes Pohl <johannes.pohl90@gmail.com>
pkgname=urh
license=('GPL3')
pkgver=1.6.1.5
pkgrel=1
pkgdesc="Universal Radio Hacker: investigate wireless protocols like a boss"
arch=('i686' 'x86_64')
url="https://github.com/jopohl/urh"
depends=('python>=3.4' 'python-pyqt5' 'python-numpy' 'python-psutil' 'python-pyzmq')
makedepends=('gcc' 'python-setuptools')
optdepends=(
  'hackrf: for native hackrf backend'
  'rtl-sdr: for native RTL-SDR backend'
  'gnuradio: for USRP gnuradio backend'
  'gnuradio-osmosdr: for more gnuradio device backends (HackRF, FunCubeDongle, RTL-SDR)'
)

source=($pkgname-$pkgver.tar.gz::https://github.com/jopohl/urh/tarball/v$pkgver)
md5sums=('cb28cbc43ad339b37df2ac5276e12637')
sha256sums=('bb4f953ccd9c37ca76471126d908d91534502e631092b97ab205a8aa0849fc9b')

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

