# Maintainer: Lex Black <autumn-wind@web.de>

_module=ocrmypdf-papermerge
pkgname=python-${_module}
pkgver=0.4.6
pkgrel=2
pkgdesc="OCRmyPDF Papermerge plugin"
arch=(any)
url="https://github.com/papermerge/OCRmyPDF_papermerge"
license=(Apache)
depends=(ocrmypdf python-jinja python-lxml)
makedepends=(python-build python-installer python-wheel python-poetry-core)
source=(https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module//-/_}-$pkgver.tar.gz
        001_files-in-base.patch)
sha256sums=('373b7c23488d3b432f6fdb2ea40360f631f4e0290c128a296619f1d84174917b'
            'b2f940c015e006ee98926e75fdd62a7241ccb5a3d4b91e3d29ff2bb06eed6194')


prepare() {
  cd "${_module//-/_}-${pkgver}"
  # Without this patch files would get installed into base site-packages dir
  patch -Np1 -i "${srcdir}"/001_files-in-base.patch
}

build() {
  cd "${_module//-/_}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_module//-/_}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
