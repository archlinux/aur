# Maintainer: j.r <j.r@jugendhacker.de>
_pkgname=ofxstatement-sparkasse-de
pkgname=$_pkgname-git
pkgver=r10.8f93b9f
pkgrel=1
pkgdesc="ofxstatement plugin to import Sparkasse PDF statements"
arch=(any)
url=""https://github.com/FliegendeWurst/ofxstatement-sparkasse-de
license=('GPL-3.0-only')
depends=('python3' 'ofxstatement' 'python-pdfplumber')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/FliegendeWurst/ofxstatement-sparkasse-de.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
