# Contributor: Daniel E. Shub <daniel.e.shub@gmail.com>

pkgname=python-psychtoolbox
pkgver=3.0.19.0
pkgrel=1
pkgdesc="Pieces of Psychtoolbox-3 ported to CPython"
arch=('any')
url="https://pypi.org/project/psychtoolbox/"
license=('custom')
makedepends=('python-setuptools' 'libxfixes' 'python-wheel')
depends=('alsa-lib' 'libxi' 'libusb' 'portaudio' 'python-numpy')
source=(https://files.pythonhosted.org/packages/source/p/${pkgname/python-/}/${pkgname/python-/}-${pkgver}.tar.gz)
sha512sums=('89711cf086e19fd02e257ca5b1acb999ca38fa2b509f60f65fa0b804f43a7850a8e20bba56fcfbb004d67bd214fd7255811c561d8b0e731d6c0347f80283e561')

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
