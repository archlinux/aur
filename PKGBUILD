# Maintainer: Sean Greenslade <aur@seangreenslade.com>

pkgname=python2-keepass-git
pkgver=r32.4a0467d
pkgver() {
	cd "$srcdir/python-keepass"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="Keepass bindings for python2"
url="http://github.com/brettviren/python-keepass"
depends=('python2' 'python2-crypto')
makedepends=('python2-distribute' 'git')
license=('GPL2')
arch=('any')
source=("python-keepass::git+https://github.com/brettviren/python-keepass.git")
sha256sums=(SKIP)

build() {
	cd "$srcdir/python-keepass"
	find . -exec sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' {} \;
}

package() {
	cd "$srcdir/python-keepass"
	python2 setup.py install --root="$pkgdir" --optimize=1
}
