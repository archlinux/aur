# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

_pkgname=KindleUnpack
pkgname=${_pkgname,,}
pkgver=0.84
_pkgver=${pkgver/./}
pkgrel=1
pkgdesc='Extract text, images, and metadata from Kindle/Mobi files'
arch=(any)
url="https://github.com/kevinhendricks/$_pkgname"
license=(GPL-3.0-only)
depends=(python
         tk)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_pkgname-$_pkgver"
source=("$url/archive/v$_pkgver/$_archive.tar.gz"
        Installing-with-setuptools.diff)
sha256sums=('560f785731d1d70b651f792e7fa9c4406c04c8b90dc9a2ffae04ef5713221453'
            '4c4eb18f9716875d90cf6c6b781ece9cbb316e2dcecebd2e89caec142bd25505')
prepare() {
	cd "$_archive"
	patch -p1 -i ../Installing-with-setuptools.diff
}

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
