# Maintainer: grandchild
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=python-pyclipper
_pyname=pyclipper
pkgname="python-$_pyname"
pkgver=1.3.0.post3
pkgrel=1
pkgdesc='Cython wrapper for the C++ translation of the Angus Johnson’s Clipper library'
url="https://github.com/fonttools/$_pyname"
arch=(x86_64 i686)
license=(MIT)
depends=(python)
makedepends=(cython
             python-{build,installer,wheel}
             python-setuptools-scm{,-git-archive})
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('639fbc55569b94487f89261b1656e3e655d06888a582218c5432c426705d1f6f')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
