# Maintainer: Johannes Pohl <johannes.pohl90@gmail.com>
pkgname=urh
license=('Apache')
pkgver=1.2.4.3
pkgrel=1
pkgdesc="Universal Radio Hacker - Hacking wireless protocols made easy"
arch=('i686' 'x86_64')
url="https://github.com/jopohl/urh"
depends=('python>=3.4' 'python-pyqt5' 'python-numpy' 'python-psutil')
makedepends=('gcc' 'python-setuptools')
optdepends=(
  'hackrf: for native hackrf backend'
  'gnuradio: for USRP gnuradio backend'
  'gnuradio-osmosdr: for more gnuradio device backends (HackRF, FunCubeDongle, RTL-SDR)'
)

source=($pkgname-$pkgver.tar.gz::https://github.com/jopohl/urh/tarball/v$pkgver)
md5sums=('ed65c77a6acc2109fe5ea924fbc1db41')
sha256sums=('83cd981c866795a9a590a4f0e735579f2c4fcaf8b3d1a8a6c2dff0f6f6766090')

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

