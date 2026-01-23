# Maintainer: Alexander Schnaidt <alex.schnaidt@gmail.com>

pkgname=sandwine
pkgver=6.0.0
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
sha256sums=('5c0cb3068da379cc221655815b7120797f0d12502ae5f5fb58a8db4ea8b68046')

build()	{
	cd $pkgname-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $pkgname-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}

