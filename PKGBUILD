# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Contributor: Pierre Chapuis <catwell at archlinux dot us>

_name=decorator
pkgname=python38-decorator
pkgver=5.1.1
pkgrel=2
pkgdesc='Python 3.8 Decorator module'
arch=('any')
url='https://pypi.python.org/pypi/decorator'
license=('BSD')
depends=('python38')
makedepends=('python38' 'python38-setuptools')
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz"
        'LICENSE.txt')
sha512sums=('584857ffb0c3e52344b473ceb9e28adfd7d789d480a528471f8ab37be055ebe5feb170f41077010e25350e1c311189d45b90773cf12f0043de98ea8ebcde20ab'
            '0a06dfb3f470b8d3b056bd4e4776df715876d04d0acc86dec536fa7cff0214ba5255833923558d1778db730d080960f31d5e12f939e761530823b6e70646b5c2')

build() {
  cd "$srcdir/$_name-$pkgver"

  python3.8 setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"

  python3.8 setup.py install --root="${pkgdir}" --optimize=1

  install -D -m644 "${srcdir}/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
  cd "$srcdir/${_name}-$pkgver"

  python3.8 -m unittest discover -vs .
}
