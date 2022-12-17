# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gphotos-sync
pkgver=3.4
pkgrel=1
pkgdesc='Google Photos and Albums backup tool'
arch=(any)
url="https://github.com/gilesknap/$pkgname"
license=(MIT)
_py_deps=(attrs
          appdirs
          exif
          google-auth-oauthlib
          psutil
          psutil
          pyyaml
          requests-oauthlib
          types-pyyaml
          types-requests)
depends=(python
         "${_py_deps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
_archive="$pkgname-$pkgver"
# source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
source=("$url/releases/download/3.04/$_archive.tar.gz")
sha256sums=('342db5ee83f181b7dbba4d0d4946fdda2f0847020922e30f45346f40aced9143')

prepare() {
	cd "$_archive"
	sed -i -e '/^requires/s/[<>=]\+[0-9.]\+"/"/g' pyproject.toml
}

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
