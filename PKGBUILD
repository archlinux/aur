# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-fontparts')
_pkgname='fontParts'
pkgver='0.8.7'
pkgrel=1
pkgdesc='The replacement for RoboFab.'
url='https://github.com/robotools/fontParts'
checkdepends=('python-fontpens')
depends=('python' 'python-defcon' 'python-fontmath' 'python-fonttools')
makedepends=('python-setuptools')
optdepends=()
license=('MIT')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.zip")
sha256sums=('8db7ee766f8a2e407dbbd6ce090987b9889e87ef7de71421e8379a7db9bf9d97')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
  cd "$srcdir/$_pkgname-$pkgver/Lib"
  sed -e 's/unittest2 as //' -i fontParts/test/test_deprecated.py
  PYTHONPATH=. python fontParts/fontshell/test.py
}

