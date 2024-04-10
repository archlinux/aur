# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-pyffmpeg
_pyname=${pkgname#python-}
pkgver=2.4.2.19
pkgrel=1
pkgdesc='FFmpeg wrapper for Python'
arch=(any)
url="https://github.com/deuteronomy-works/$_pyname"
license=(Apache)
depends=(ffmpeg
         python)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_pyname-$pkgver"
# Project stoped posting source distributions to Pypi
# source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('8003f3e1ff7375f85800cfbefe06a50c0407a311e9732a22e36b61919da441b9')

build() {
	# Project source isn't setup for build outside of CI...
	export GITHUB_REF="$pkgver"
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
