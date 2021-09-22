# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=nbstripout
pkgname=python-$_pyname
pkgver=0.5.0
pkgrel=2
pkgdesc='Strips outputs from Jupyter and IPython notebooks'
url="https://pypi.python.org/pypi/$_pyname/"
depends=('python' 'jupyter-nbformat')
checkdepends=('python-pytest' 'python-pytest-cram')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz"
"https://raw.githubusercontent.com/kynan/nbstripout/master/LICENSE.txt")
sha256sums=('86ab50136998d62c9fa92478d2eb9ddc4137e51a28568f78fa8f24a6fbb6a7d8'
            'cceb6581e12b4e46f8291d138b15731e8b77e6e1eee9dca23be2297e2c48fe29')

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
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd $_pyname-$pkgver
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
