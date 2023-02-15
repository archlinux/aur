# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python-ntfs
_pkgname=${pkgname/thon-/-}
pkgver=0.1.5
pkgrel=2
pkgdesc='Python module to manipulate NTFS junctions and hardlinks'
arch=(any)
url="https://github.com/sunshowers-code/$_pkgname"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
_archive="$_pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('9a927a0821460bf3e3a9bfc0b3e23aa732f056aadbc5c116ebac6a6dca56f5c3')

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	local _py3_ver=$(python --version | cut -d " " -f2)
	rm -rf "$pkgdir/usr/lib/python${_py3_ver%.*}/site-packages/tests"
}
