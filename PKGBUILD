# Maintainer:  Tim Jester-Pfadt <t.jp at gmx.de>

pkgname=python-blocks-git
pkgver=2398.a5376e1
pkgrel=1
pkgdesc='A Theano framework for building and training neural networks.'
arch=(x86_64)
url='https://github.com/mila-udem/blocks'
license=('MIT')
depends=('python' 'python-toolz' 'python-six' 'python-pandas' 'python-progressbar' 'python-numpy' 'python-pytables' 'python-pyyaml')
source=('git+https://github.com/mila-udem/blocks.git')
sha256sums=('SKIP')
makedepends=('git' 'python-setuptools')
provides=('python-blocks')

pkgver() {
	cd "$srcdir"/blocks
  	echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  	cd blocks
  	python setup.py build
}

check() {
  	cd blocks
  	python setup.py test --verbose
}

package() {
  	cd blocks

  	# We don't need anything related to git in the package
  	rm -rf .git*

  	# script tries to force develop mode - force install mode by echoing install to the script
  	echo "install" | python setup.py install --root="${pkgdir}" --optimize=1

  	# Install License
  	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  	# Install Documentation
  	install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
