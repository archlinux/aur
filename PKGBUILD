# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: TransistorLogic <liuhongwu2003@outlook.com>
# Maintainer: Sving1024 <sving1024@outlook.com>

# Author: Luogu Development Team <k@luogu.org> (https://github.com/luogu-dev)
# The copyright of this library belongs to Luogu (https://www.luogu.com.cn/).
# The library is released under LGPLv3.

_name=cyaron
pkgname=python-${_name}
pkgver=0.6.0
pkgrel=1
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
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('c9aa6449cb4a2738120662f05a7112978a6f379c89bdf304e418ad73606f86f6')
validpgpkeys=('517E4E3C364C6C55C907284915AC252CE20E3FC8')
conflicts=('python-cyaron-git')

build() {
	cd ${srcdir}/${_name}-${pkgver}
	python -m build --wheel --no-isolation
}

check(){
    cd ${srcdir}/${_name}-$pkgver
    pytest
}

package() {
	cd ${srcdir}/$_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
