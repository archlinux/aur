# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gphotos-sync
pkgver=3.0.3
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
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('4b3da700c8260823db2a0ea568652101767f51632acd6736f783884059742cbc')

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
