# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python-ntfs
_pkgname=${pkgname#python-}
pkgver=0.1.4
pkgrel=4
pkgdesc='Python module to manipulate NTFS junctions and hardlinks'
arch=(any)
url="https://github.com/sunshowers/$_pkgname"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
_archive="$_pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz"
        "$url/pull/13/commits/8b990e3459ca2ccaf96113ce3442464c6147cdc0.patch")
sha256sums=('80ada586fd132b1db9fc6b2a844b98f4e2a883cb26f115f6af2b58f84295da98'
            '9c47b8b4f95570918bf5afb57a80f534eba0be1ca078940566240f2a6e2f362a')

# https://github.com/sunshowers/ntfs/issues/14
# https://github.com/pypa/setuptools/blob/main/CHANGES.rst#v5800
prepare() {
	cd "$_archive"
	patch -p1 < "../${source[1]##*/}"
}

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
