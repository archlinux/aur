# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=nbstripout
pkgname=python-$_pyname
pkgver=0.7.1
pkgrel=1
pkgdesc='Strips outputs from Jupyter and IPython notebooks'
url="https://pypi.python.org/pypi/$_pyname/"
depends=('python' 'jupyter-nbformat')
checkdepends=('python-pytest' 'python-pytest-cram')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
sha256sums=('2aad3454dc13e356f2fc94917856bc44f2bed3add77e8ba9f3a78003074bcd84')

prepare() {
  cd $_pyname-$pkgver
  rm -rf nbstripout.egg-info
  sed -i '/pytest-runner/d' setup.py
}

build() {
  cd $_pyname-$pkgver
  python setup.py build
}

package() {
  cd $_pyname-$pkgver
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

#check() {
  #cd $_pyname-$pkgver
  #cat >nbstripout.tmp <<EOL
##! /usr/bin/python
#from nbstripout._nbstripout import main
#main()
#EOL
  #chmod +x nbstripout.tmp
  #PYTHONPATH=. NBSTRIPOUT_EXE="$(pwd)/nbstripout.tmp" pytest tests 
#}
