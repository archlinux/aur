# Maintainer: grandchild
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=python-pyclipper
_pyname=pyclipper
pkgname="python-$_pyname"
pkgver=1.3.0.post4
pkgrel=2
pkgdesc='Cython wrapper for the C++ translation of the Angus Johnson’s Clipper library'
url="https://github.com/fonttools/$_pyname"
arch=(x86_64 i686)
license=(MIT)
depends=(python)
makedepends=(cython
             python-{build,installer,wheel}
             python-setuptools-scm)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz"
        update-scm-version.patch)
sha256sums=('b73b19d2a1b895edcacaf4acb441e13e99b9e5fd53b9c0dfd2e1326e2bf68a7a'
            '0e3cf27a376ba54c15c05b2cc6bbacd55ca7984ebe326ce4d825058a69c1a087')

prepare() {
	cd "$_archive"
        patch -p1 -i "$srcdir/${source[1]}"
}

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
