# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Florijan Hamzic <florijanh at gmail dot com>

_pypi_name=weasyprint
pkgname=python-$_pypi_name
pkgver=53.0
pkgrel=1
pkgdesc='Convert web documents (HTML, CSS, SVG, ...) to PDF'
arch=(any)
url=http://weasyprint.org
license=(BSD)
_py_deps=(brotli # for fonttools[woff]
          cffi
          cssselect2
          fonttools
          html5lib
          pillow
          pydyf
          pyphen
          tinycss2
          zopfli) # for fonttools[woff]
depends=(pango
         python
         "${_py_deps[@]/#/python-}")
makedepends=(python-pytest-runner
             python-setuptools)
_archive="$_pypi_name-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pypi_name::1}/$_pypi_name/$_archive.tar.gz")
sha256sums=('21ea1626e15ae4070f3eb4ffc90e5fd65bf17650f912affa911f829fb7c0e112')

build() {
	cd "$_archive"
	export PYTHONHASHSEED=0
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
