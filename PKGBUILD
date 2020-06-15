# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Tim Jester-Pfadt <t.jp at gmx.de>

pkgname=python-lasagne-git
pkgver=0.1.r371.g5d3c63c
pkgrel=1
pkgdesc='Lasagne is a lightweight library to build and train neural networks in Theano.'
arch=(x86_64)
url='https://github.com/benanne/lasagne'
license=('MIT')
depends=('python' 'python-theano')
source=('git+https://github.com/benanne/lasagne')
sha256sums=('SKIP')
makedepends=('git' 'python-setuptools')
provides=('python-lasagne')

pkgver() {
  cd "$srcdir/lasagne"
  # cutting off 'v' prefix that presents in the git tag
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/lasagne"
  python setup.py build
}

check() {
  cd "$srcdir/lasagne"
  python setup.py test --verbose
}

package() {
  cd "$srcdir/lasagne"

  # We don't need anything related to git in the package
  rm -rf .git*

  python setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
