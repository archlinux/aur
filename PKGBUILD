# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

_pkgname=KindleUnpack
pkgname=${_pkgname,,}
pkgver=0.83
_pkgver=${pkgver/./}
pkgrel=2
pkgdesc='Extract text, images, and metadata from Kindle/Mobi files'
arch=(any)
url="https://github.com/kevinhendricks/$_pkgname"
license=(GPL3)
depends=(python-setuptools
         tk)
_archive="$_pkgname-$_pkgver"
source=("$url/archive/v$_pkgver/$_archive.tar.gz"
        "Installing-with-setuptools.diff")
sha256sums=('cd7a539573dedd1d78a6b49606446aa5a51acb520b4ee0ccb9f5b30deaddad2e'
            '4c4eb18f9716875d90cf6c6b781ece9cbb316e2dcecebd2e89caec142bd25505')
prepare() {
	cd "$_archive"
	patch -p1 < ../Installing-with-setuptools.diff
}

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
