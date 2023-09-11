pkgname=whatlastgenre-git
_pkgname=whatlastgenre
pkgver=20230911.g05a1b4d87183cc23c6fb2b4719e23268ed118f2c
pkgrel=1
pkgdesc='Improve genre metadata of audio files based on tags from various music sites.'
arch=(any)
url='https://github.com/YetAnotherNerd/whatlastgenre'
license=(MIT)
optdepends=(python-rauth python-requests-cache)
depends=(python python-mutagen python-requests)
makedepends=(git python-build python-installer python-wheel python-setuptools)
source=('git+https://github.com/YetAnotherNerd/whatlastgenre.git')
sha256sums=('SKIP')

prepare() {
	cd "$srcdir/$_pkgname"
	date +"%Y%m%d"."g$(git rev-parse HEAD)"
	git clean -dfx
}

build() {
	cd "$_pkgname"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
