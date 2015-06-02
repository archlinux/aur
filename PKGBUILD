# Maintainer:  Tim Jester-Pfadt <t.jp at gmx.de>

pkgname=python-lasagne-git
pkgver=567.b22500e
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
	cd "$srcdir"/lasagne
  	echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  	cd lasagne
  	python setup.py build
}

check() {
  	cd lasagne
  	python setup.py test --verbose
}

package() {
  	cd lasagne

  	# We don't need anything related to git in the package
  	rm -rf .git*

  	# script tries to force develop mode - force install mode by echoing install to the script
  	echo "install" | python setup.py install --root="${pkgdir}" --optimize=1

  	# Install License
  	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  	# Install Documentation
  	install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
