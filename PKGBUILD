# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>

pkgbase=python-mbdata
_name=${pkgbase#python-}
pkgname=($pkgbase ${pkgbase/python-/python2-})
pkgver=2019.4.26
pkgrel=1
pkgdesc='MusicBrainz database tools for Python'
url="https://pypi.python.org/pypi/$_name"
arch=('any')
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "$_name-$pkgver-LICENSE::https://github.com/lalinsky/mbdata/raw/4e3d1927db9f085a09945a21c0d0ae82682f91fd/LICENSE")
sha256sums=('abf869e3982b83a4e61ecfa9e377de53b4f1977101c02b26d51c037669d71c11'
            'ecae6699839c9b7845aa36aba997c2ec5f09c5eb237f8910b972269de4bfc5f9')

prepare() {
  cp -a $_name-$pkgver python2
  mv $_name-$pkgver python3
}

build() {
  pushd python3
  python3 setup.py build
  popd

  pushd python2
  python2 setup.py build
}

package_python-mbdata() {
  depends=(python python-psycopg2 python-six)

  cd python3
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 ../"$_name-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgbase/LICENSE"
}

package_python2-mbdata() {
  depends=(python2 python2-psycopg2 python2-six)

  cd python2
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 ../"$_name-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/${pkgbase/python-/python2-}/LICENSE"
}
