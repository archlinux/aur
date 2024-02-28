# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

_name='Google-Images-Search'
pkgname='python-google-images-search'
pkgver='1.4.6'
pkgrel='1'
pkgdesc="Search for image using Google Custom Search API and resize & crop the image afterwords"
arch=("any")
url="https://github.com/arrrlo/${_name}"
makedepends=('python-build' 'python-installer')
depends=('python-colorama' 'python-pyfiglet' 'python-termcolor' 'python-click' 'python-six'
	 'python-requests' 'python-pillow' 'python-resize-image' 'python-google-api-python-client')
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1cae993bd894bcfeff384cecb2f36a72be78322a7e798db0440312673ec03ff7')

prepare() {
  cd "${srcdir}/${_name}-${pkgver}"
  sed -ri 's|click>=7.0<=8.1.\*|click ~= 8.1|g' "setup.py"
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" "dist/"*".whl"
  install -Dm0644 "LICENSE" "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
