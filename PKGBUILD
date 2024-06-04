# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gphotos-sync
pkgver=3.2.3
pkgrel=1
epoch=2
pkgdesc='Google Photos and Albums backup tool'
arch=(any)
url="https://github.com/gilesknap/$pkgname"
license=(MIT)
_pydeps=(attrs
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
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
_archive="${pkgname/-/_}-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('9abd0738144c4ba8ff8d2f6a7db97d246f3ff3050fc5babc20027b08a20ac3c4')

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
