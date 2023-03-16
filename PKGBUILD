# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=plum
pkgname=python-${_pyname,,}
pkgver=0.8.5
pkgrel=2
pkgdesc='Pack/Unpack Memory'
arch=(any)
url="https://$_pyname-py.readthedocs.io/en/latest/"
license=(MIT)
depends=(python)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_pyname-$pkgver"
source=("https://gitlab.com/dangass/$_pyname/-/archive/$pkgver/$_archive.tar.bz2")
sha256sums=('41016eed6cdbe1429afc21654cd05f935fc13ae8eb465981f6c3b1e92c57319e')

prepare() {
	cd "$_archive"
	sed -i -e '/python_requires/d' setup.cfg
}

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
