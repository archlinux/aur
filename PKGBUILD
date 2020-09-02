# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-fontparts'
_pkgname='fontParts'
pkgver='0.9.4'
pkgrel=1
pkgdesc='The replacement for RoboFab'
url='https://github.com/robotools/fontParts'
checkdepends=('python-fontpens')
depends=('python' 'python-booleanoperations' 'python-defcon' 'python-fontmath' 'python-fonttools' 'python-fs')
makedepends=('python-setuptools')
optdepends=()
license=('MIT')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.zip")
sha256sums=('a7ed8a93f77d672c5e549a417b9527e0a9b5c54b5b91b5097cd6fd13c6901b23')

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

