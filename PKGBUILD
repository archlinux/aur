#Maintainer: jnanar <info@agayon.be>

pkgname=python-shortuuid-git
pkgver=v1.0.2.r19.gcd70fe2
pkgrel=1
pkgdesc="shortuuid is a simple python library that generates concise, unambiguous, URL-safe UUIDs."
arch=(any)
url="https://github.com/skorokithakis/shortuuid"
license=('BSD')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer')
options=(!emptydirs)
provides=('python-shortuuid')
replaces=('python-shortuuid')
conflicts=('python-shortuuid')
#optdepends=('')

source=('git+https://github.com/skorokithakis/shortuuid.git')
_gitname="shortuuid"
md5sums=('SKIP')


pkgver() {
  cd $_gitname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_gitname"
        poetry build
}

package() {
	cd "$srcdir/$_gitname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
