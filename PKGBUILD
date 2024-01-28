# Maintainer: Nikos Toutoutzoglou <nikos.toutou@protonmail.com>

pkgname=python-iptvtools
_name=iptvtools
pkgver=0.2.11
pkgrel=4
pkgdesc="Provides iptv-filter script tool to maintain IPTV lists."
arch=('any')
url="https://github.com/huxuan/iptvtools"
license=('MIT')
depends=('python' 'python-tqdm' 'python-setuptools-scm' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel' 'python-sphinx' 'python-sphinxcontrib-programoutput')
optdepends=('ffmpeg')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('e27777bea615c653229b7f76f08ed964e7ba50a49b2b8d4c1e3b671a72bd9f0d')

build(){
	cd $_name-$pkgver
	python -m build --wheel --no-isolation

	# create man page
	make -C docs man
}

package() {
	cd $_name-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

	# man pages
	install -vDm644 -t "$pkgdir/usr/share/man/man1" docs/_build/man/*.1
}
