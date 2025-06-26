# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: TransistorLogic <liuhongwu2003@outlook.com>
# Maintainer: Sving1024 <sving1024@outlook.com>

# Author: Luogu Development Team <k@luogu.org> (https://github.com/luogu-dev)
# The copyright of this library belongs to Luogu (https://www.luogu.com.cn/).
# The library is released under LGPLv3.

_name=cyaron
pkgname=python-${_name}-git
pkgver=v0.7.0.r0.g0865426
pkgrel=2
pkgdesc="Random Olympic-informatics test data generator"
url="https://github.com/luogu-dev/cyaron"
license=('LGPL3')
arch=('any')
depends=('python' 'python-colorful' 'python-xeger')
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel'
    'python-poetry-core'
)
source=("${_name}::git+https://github.com/luogu-dev/cyaron.git")
sha256sums=('SKIP')
validpgpkeys=('517E4E3C364C6C55C907284915AC252CE20E3FC8')
provides=('python-cyaron')

pkgver() {
  	cd ${srcdir}/${_name}
  	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


check(){
    cd ${srcdir}/${_name}
    python -m unittest
}

build() {
	cd ${srcdir}/${_name}
	python -m build --wheel --no-isolation
}

package() {
	cd ${srcdir}/$_name
    python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
