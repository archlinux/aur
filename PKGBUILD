# Contributor: Sergio Tridente <tioduke at gmail dot com>

_pkgname=habitica
pkgname=python-habitica
pkgver=0.0.12
pkgrel=1
pkgdesc="Commandline interface to Habitica."
arch=('any')
url="https://github.com/philadams/habitica"
license=('MIT')
depends=('python' 'python-docopt' 'python-requests')
makedepends=('git' 'python-setuptools')
source=('git+https://github.com/philadams/habitica.git#branch=master'
        python3-compat.patch)
md5sums=('SKIP'
         '9cff7cfe5d8ad78c92971ec73b56a509')


prepare() {
  cd "$srcdir"
  patch -p0 -i python3-compat.patch
}

build() {
  cd "$srcdir/${_pkgname}"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}"
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm644 README.md "$pkgdir"/usr/share/doc/${_pkgname}/README.txt
  install -Dm644 netrc.sample "$pkgdir"/usr/share/examples/${_pkgname}/netrc.sample
}
