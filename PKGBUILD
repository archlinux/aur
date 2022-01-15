# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-cyclonedx-lib
_gitpkgname=cyclonedx-python-lib
pkgver=1.1.0
pkgrel=1
pkgdesc='Library for producing CycloneDX SBOM (Software Bill of Materials) files'
arch=('any')
url='https://github.com/CycloneDX/cyclonedx-python-lib'
license=('Apache')
depends=('python-packageurl' 'python-setuptools' 'python-importlib-metadata' 'python-toml' 'python-typing-extensions')
makedepends=('python-dephell')
conflicts=('python-cyclonedx-lib-git')
options=('!strip')
source=("${_gitpkgname}-${pkgver}.tar.gz::https://github.com/CycloneDX/cyclonedx-python-lib/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('cc1e0968974ba4f5fa10094e781507b64725aa357b2c3b266bc4351bbc0c107531f52c24678f4abed82156bccd4cc6b91b239793312db015c353e3e3baf3f6f9')

prepare() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
