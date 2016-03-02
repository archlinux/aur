# Contributor: tuftedocelot <tuftedocelot@fastmail.fm>

pkgbase=python-filterpy
pkgname=(python-filterpy python2-filterpy)
pkgver=0.1.2
pkgrel=1
pkgdesc='Kalman filtering and optimal estimation library in Python.'
arch=('any')
url='https://github.com/rlabbe/filterpy'
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'python-numpy' 'python2-numpy' 
              'python-scipy' 'python2-scipy' 'python-matplotlib' 'python2-matplotlib')
source=("https://github.com/rlabbe/filterpy/archive/$pkgver.tar.gz")
sha256sums=('42542b8a3e1792b4393ba0288cea2158ee922d029103b6cf8d52f3d11103554d')

prepare() {
  cp -a filterpy-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/filterpy-$pkgver
  python setup.py build

  cd "$srcdir"/filterpy-$pkgver-py2
  python2 setup.py build
}

package_python-filterpy() {
  depends=('python-setuptools')

  cd "$srcdir"/filterpy-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}

package_python2-filterpy() {
  depends=('python2-setuptools')

  cd "$srcdir"/filterpy-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
