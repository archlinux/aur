# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-cyclonedx-lib
_gitpkgname=cyclonedx-python-lib
pkgver=0.12.3
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
sha512sums=('0898f257ead0c4a16d17df9e703f568c886e8750ef6169431645a7c8bf5369325265eab909a5f6accb83dbca073fe0b1e2c4b2210bcf91cca993f9ff148bd04e')

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
