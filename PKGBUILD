# Maintainer: Ashwin Vishnu <ashwinvis+arch at pr0t0nm4il dot com>

pkgname=python-beniget
pkgver=0.2.3
pkgrel=1
pkgdesc="A static analyzer for Python3 code"
arch=('i686' 'x86_64')
url="https://github.com/serge-sans-paille/beniget"
license=('BSD')
makedepends=('python-setuptools')
_name=${pkgname#python-}
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('350422b0598c92fcc5f8bcaf77f2a62f6744fb8f2fb495b10a50176c1283639f')
depends=('python' 'python-gast')
provides=('python-beniget')

build() {
  cd "$srcdir"/beniget-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/beniget-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -m755 -d "${pkgdir}/usr/share/licenses/python-beniget"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/python-beniget/"
}
