# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>

pkgname=outwiker
pkgver=3.1.0.900
pkgrel=1
pkgdesc='Outliner and personal wiki with keeping the tree of notes in the form of directories on a disk'
arch=('any')
url='https://github.com/jenyay/outwiker'
license=('GPL3')
depends=('python-idna' 'python-pillow' 'python-psutil' 'python-pyparsing' 'python-wxpython')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/stable_$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f4444811722dc8cf9afb967bf0bd07cf9e97eff46ce28564097c1b039af35ee3')

build() {
	cd "$pkgname-stable_${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-stable_${pkgver}"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	make DESTDIR="$pkgdir" install
}
