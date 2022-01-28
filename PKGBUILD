# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=python-merge3
pkgver=0.0.8
pkgrel=2
pkgdesc="Python implementation of 3-way merge."
arch=('any')
url="https://github.com/breezy-team/merge3"
license=('GPL2')
depends=('python')
makedepends=('python-setuptools')
source=(
	"$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/m/merge3/merge3-$pkgver.tar.gz"
	"$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/m/merge3/merge3-$pkgver.tar.gz.asc")
sha256sums=('4ef90eda29fb6f291e5d5ee1103ae97e295e15826ef17abee3098f5ce46fe18b'
            'SKIP')
validpgpkeys=('DC837EE14A7E37347E87061700806F2BD729A457') # Jelmer Vernooĳ <jelmer@jelmer.uk>

build() {
	cd "merge3-$pkgver"
	python setup.py build
}

check() {
	cd "merge3-$pkgver"
	python -m unittest discover
}

package() {
	export PYTHONHASHSEED=0
	cd "merge3-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
