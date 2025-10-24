# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Daniel E. Shub <daniel.e.shub@gmail.com>

pkgname=python-psychtoolbox
pkgver=3.0.19.14
pkgrel=2
pkgdesc="Pieces of Psychtoolbox-3 ported to CPython"
arch=('any')
url="https://pypi.org/project/psychtoolbox/"
license=('custom')
depends=('alsa-lib' 'gcc-libs' 'glibc' 'libusb' 'libx11' 'libxi' 'portaudio' 'python' 'python-numpy')
makedepends=('libxfixes' 'python-setuptools' 'python-wheel')
source=(https://files.pythonhosted.org/packages/source/p/${pkgname/python-/}/${pkgname/python-/}-${pkgver}.tar.gz)
sha512sums=('1bea170fd8891e410796f44c6111e2d3f55492a5257d93d57601402067d47fb8dfc2c3def606c6d50aecf5f6ab3e98d4218768c4cd61114573a74b742cdd5bd3')

build() {
  cd "$srcdir/${pkgname/python-/}-$pkgver"
  CFLAGS+=" -Wno-implicit-function-declaration"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname/python-/}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 PsychSourceGL/License.txt "$pkgdir/"usr/share/licenses/"$pkgname"/LICENSE
}
