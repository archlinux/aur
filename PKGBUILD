# Maintainer: Alexander Schnaidt <alex.schnaidt@gmail.com>

pkgname=sandwine
pkgver=8.0.1
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
sha256sums=('b2f25665f4181f987eceb5795eb3def0c66791d35bc2ce93c31703f323507d66')

build()	{
	cd $pkgname-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $pkgname-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}

