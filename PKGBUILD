# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

_ipset='ipsetpy'
pkgname="python-${_ipset}"
pkgver='0.0.1a3'
pkgrel='2'
pkgdesc='Python ipset bindings and helper'
arch=('any')
url="https://github.com/sanyi/${_ipset}"
license=('GPL3')
depends=('python' 'ipset')
makedepends=('python-build' 'python-installer')
source=("https://pypi.io/packages/source/${_ipset:0:1}/${_ipset}/${_ipset}-v${pkgver}.tar.gz")
sha256sums=('448f0264d22ef0d9e50f938f42435c21ac97011c2177644620e246f8e773721d')

build() {
  cd "${_ipset}-v${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_ipset}-v${pkgver}"
  python -m installer --destdir="${pkgdir}" "dist/"*".whl"
  mkdir -p "${pkgdir}/usr/share/doc/${_ipset}"
  mv "${pkgdir}/usr/README.md" "${pkgdir}/usr/share/doc/${_ipset}/README.md"
  mv "${pkgdir}/usr/LICENSE" "${pkgdir}/usr/share/doc/${_ipset}/LICENSE"
  rm "${pkgdir}/usr/TODO.md"
}
