# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>

pkgname=pylama
pkgver=7.0.9
pkgrel=2
pkgdesc="Code audit tool for python"
arch=('any')
url="https://github.com/klen/pylama"
license=('GPL3')
depends=('python-pycodestyle' 'pydocstyle' 'python-pyflakes' 'python-mccabe')
optdepends=('pylama_pylint: pylint support')
source=("https://github.com/klen/pylama/archive/$pkgver.tar.gz")
sha256sums=('bd28f352bb2c336d572e1c5ec2fabab44c06a8d8bc91e9f47da441f2329bf7db')

prepare() {
  cd "$pkgname-$pkgver"

  sed -i 's/pep257/pydocstyle/' "requirements.txt" "pylama/lint/pylama_pep257.py"
  sed -i 's/pep8/pycodestyle/' "requirements.txt" "pylama/lint/pylama_pep8.py"
}

package() {
  cd "$pkgname-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1
}
