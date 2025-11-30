# Maintainer: Alexander Schnaidt <alex.schnaidt@gmail.com>

pkgname=sandwine
pkgver=5.0.0
pkgrel=1
pkgdesc="Command-line tool to run Windows apps with Wine and bwrap/bubblewrap isolation on Linux "
arch=(any)
url=https://github.com/hartwork/sandwine
license=(GPL-3.0-or-later)
depends=(bubblewrap
	 python
	 python-coloredlogs
	 wine)
makedepends=(python-setuptools
	     python-build
	     python-installer)
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver.tar.gz)
sha256sums=('4c40cfc6dafdf5c2ef9b1ad30065e19cabea636ab9771311e4a0168947cade58')

build()	{
	cd $pkgname-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $pkgname-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}

