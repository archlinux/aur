# Maintainer: Ashwin Vishnu <ashwinvis+arch at pr0t0nm4il dot com>

pkgname=python-beniget
pkgver=0.2.0
pkgrel=3
pkgdesc="A static analyzer for Python3 code"
arch=('i686' 'x86_64')
url="https://github.com/serge-sans-paille/beniget"
license=('BSD')
makedepends=('python-setuptools')
_name=${pkgname#python-}
source=("$pkgbase-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4495fb8ef0e99f9291c751856e3cc0695115e7936acc54717a3f620ab331b247')
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
