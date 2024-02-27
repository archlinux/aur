# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gphotos-sync
pkgver=3.2.1
pkgrel=1
epoch=2
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
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('763f316aa602bef52cda990744fc6e7b7659ad8f324255a3851894ddd4edde5b')

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
