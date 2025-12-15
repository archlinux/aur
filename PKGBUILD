# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-pyffmpeg
_pyname=${pkgname#python-}
pkgver=2.5.2.3.1
pkgrel=1
pkgdesc='FFmpeg wrapper for Python'
arch=(any)
url="https://github.com/deuteronomy-works/$_pyname"
license=(Apache-2.0)
depends=(ffmpeg
         python)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_pyname-$pkgver"
# Project stoped posting source distributions to Pypi
# source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('b54b7b5cc9e1fe789b80e2db52e7d6655a20e9106ac7821974c9338ad2871c92')

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
