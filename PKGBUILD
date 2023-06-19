# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-pyffmpeg
_py_name=${pkgname#python-}
pkgver=2.4.2.18
pkgrel=1
pkgdesc='FFmpeg wrapper for Python'
arch=(any)
url="https://github.com/deuteronomy-works/$_py_name"
license=(Apache)
depends=(ffmpeg
         python)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_py_name-$pkgver"
# Project stoped posting source distributions to Pypi
# source=("https://files.pythonhosted.org/packages/source/${_py_name::1}/$_py_name/$_archive.tar.gz")
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('1f4221015e0be228f9c1e8f6aa7373bf3177cabbb1d81369d289ecba42c905a5')

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
