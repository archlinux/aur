# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=python-oslash
_pkgname=OSlash
pkgver=0.6.3
pkgrel=1
pkgdesc="OSlash (Ø) is a library for playing with functional programming in Python 3.8+."
arch=('any')
depends=('python')
makedepends=('python-setuptools' 'python-nose' 'python-pip')
url="https://github.com/dbrattli/oslash"
license=('MIT')
options=('!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://github.com/dbrattli/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('f9ebaa568e0df9bbf935b8f0510b0f04147f8609a7c924de8f0f1d616818f8dd')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

check(){
    cd "$srcdir/$_pkgname-$pkgver"

    # For nosetests
    nosetests
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
