# Maintainer:  Tim Jester-Pfadt <t.jp at gmx.de>

pkgname=python-picklable-itertools-git
pkgver=115.5de7171
pkgrel=1
pkgdesc='itertools. But picklable.'
arch=(x86_64)
url='https://github.com/mila-udem/picklable-itertools'
license=('MIT')
depends=('python')
source=('git+https://github.com/mila-udem/picklable-itertools.git')
sha256sums=('SKIP')
makedepends=('git' 'python-setuptools')
provides=('python-picklable-itertools')

pkgver() {
	cd "$srcdir"/picklable-itertools
  	echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  	cd picklable-itertools
  	python setup.py build
}

check() {
  	cd picklable-itertools
  	python setup.py test --verbose
}

package() {
  	cd picklable-itertools

  	# We don't need anything related to git in the package
  	rm -rf .git*

  	# script tries to force develop mode - force install mode by echoing install to the script
  	echo "install" | python setup.py install --root="${pkgdir}" --optimize=1

  	# Install License
  	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  	# Install Documentation
  	install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
