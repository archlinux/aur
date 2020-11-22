# Submitter: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Maintainer: Mubashshir <ahmubashshir@gmail.com>
# pkg: pypi confuse
_name=confuse
pkgbase=python-confuse
pkgname=( python-$_name python2-$_name)
pkgver=1.4.0
pkgrel=1
pkgdesc='Configuration library for Python that uses YAML'
url="https://github.com/beetbox/$_name"

arch=('any')
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
#checkdepends=('python-nose' 'python2-nose')
source=("$_name-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "$_name-$pkgver-LICENSE::$url/raw/v$pkgver/LICENSE")
sha256sums=('92fc0451c6e2c2732ac363d0f59d7ea608abddbed062dda8e98e9a8c986ce464'
            '0b308ae66aaa1412ebbe645bec4002fd262d91e9cdf67b6f198026677ddfafcc')

prepare() {
  cp -rup $_name-$pkgver $_name-$pkgver-py2
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
  cd "$srcdir/$_name-$pkgver-py2"
  python2 setup.py build
}

# TODO: See https://github.com/beetbox/confuse/issues/54
#check() {
#  pushd python3
#  python3 -m nose
#  popd
#
#  pushd python2
#  python2 -m nose
#}

package_python-confuse() {
  depends=(python python-yaml)

  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 "$srcdir/$_name-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/python-$_name/LICENSE"
}

package_python2-confuse() {
  depends=(python2 python2-yaml)

  cd "$srcdir/$_name-$pkgver-py2"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 "$srcdir/$_name-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/python2-$_name/LICENSE"
}
