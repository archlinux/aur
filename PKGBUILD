# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python-ntfs
_pkgname=${pkgname/thon-/-}
pkgver=0.1.5
pkgrel=3
pkgdesc='Python module to manipulate NTFS junctions and hardlinks'
arch=(any)
url="https://github.com/sunshowers-code/$_pkgname"
license=(MIT)
depends=(python)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('9a927a0821460bf3e3a9bfc0b3e23aa732f056aadbc5c116ebac6a6dca56f5c3')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	local _pyver=$(python --version | cut -d " " -f2)
	rm -rf "$pkgdir/usr/lib/python${_pyver%.*}/site-packages/tests"
}
