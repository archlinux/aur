pkbase=python-speechrecognition
pkgname=('python-speechrecognition' 'python2-speechrecognition')
_pkgname=speech_recognition
pkgver=3.8.1
pkgrel=1
pkgdesc="Google-powered speech recognition for Python"
arch=('i686' 'x86_64')
url="https://github.com/Uberi/speech_recognition"
license=('MIT')
makedepends=('flac' 'python-setuptools' 'python2-setuptools' 'python-pyaudio' 'python2-pyaudio' 'pocketsphinx' 'python2-monotonic')
source=("https://github.com/Uberi/speech_recognition/archive/${pkgver}.tar.gz")
sha256sums=('82d3313db383409ddaf3e42625fb0c3518231a1feb5e2ed5473b10b3d5ece7bd')

prepare () {
  cp -r "$srcdir"/$_pkgname-$pkgver "$srcdir"/$_pkgname-$pkgver-py2
}

build() {
  cd $srcdir/$_pkgname-$pkgver
  python setup.py build

  cd $srcdir/$_pkgname-$pkgver-py2
  python2 setup.py build
}

package_python-speechrecognition() {
  depends=('python-pyaudio' 'pocketsphinx' 'flac')
  cd $srcdir/$_pkgname-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
}

package_python2-speechrecognition() {
  depends=('python2-pyaudio' 'pocketsphinx' 'flac' 'python2-monotonic')
  cd $srcdir/$_pkgname-$pkgver-py2
  python2 setup.py install --root=$pkgdir --optimize=1
}
