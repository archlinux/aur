# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-fontparts'
_pkgname='fontParts'
pkgver=0.9.10
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
sha256sums=('4898942385e0ea28a721fd8de3232f5db7b6c528840754fa8b703a3617b69243')

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

