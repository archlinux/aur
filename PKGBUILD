# vim: set filetype=sh:
# Maintainer: Yen Chi Hsuan <yan12125@gmail.com>

pkgname=python-jedihttp-git
pkgver=r144.d9f9f3c
pkgrel=1
pkgdesc="Simple http wrapper around jedi (yan12125's fork)"
license=('Apache')
arch=('any')
url='https://github.com/yan12125/JediHTTP'
depends=('python-bottle' 'python-jedi' 'python-waitress')
makedepends=('python-setuptools')
source=('git+https://github.com/yan12125/JediHTTP#branch=packaging')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/JediHTTP"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
	cd "${srcdir}/JediHTTP"
	python setup.py install --root="${pkgdir}" --optimize=1
}
