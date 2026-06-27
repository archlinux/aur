# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=datalad-next
pkgname=python-$_pkgname
pkgver=1.6.0
pkgrel=1
pkgdesc='extension for new and improved functionality and user experience in datalad'
arch=(any)
url="https://github.com/datalad/$_pkgname"
license=(MIT)
depends=(python
         python-datalad)
makedepends=(python-{build,installer,wheel}
             python-hatch-vcs
             python-hatchling)
_archive="$_pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('15ab667174a9c09462bad60c4623bdbdd07ff5b774a3590ac5dcb76b333e0feb')

build() {
	cd "$_archive"
	export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
