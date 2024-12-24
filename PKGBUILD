# Maintainer: redponike <proton (dot) me>
# Contributor: Butui Hu <hot123tea123@gmail.com>

_pkgname=pydeck
pkgname=python-pydeck
pkgver=0.9.1
pkgrel=2
pkgdesc='Widget for deck.gl maps'
arch=('any')
url='https://pypi.org/project/pydeck'
license=('Apache-2.0')
depends=(
  ipython
  python-ipykernel
  python-ipywidgets
  python-jinja
  python-numpy
  python-traitlets
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)

source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "0001-fix-pyproject.toml.patch"
)
sha512sums=('a9eb637f1fb999e69ac13172162f8d81dc4490498992dbd5ede444855d47b7ff77c7bd93648d42a069b02b3adb16ad9b31a1089239ddc7633dd58f29fac525df'
            'c5937cf870e2eb291a2c1cf7fa2e621a83bff61bd562c7f280b1ccb498ffccba0d721d71490141c44cef848ddf9eb20cd273b13823564889cbc682923201532f')

prepare() {
  cd "${_pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}/0001-fix-pyproject.toml.patch"
}

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation -x
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  mv -vf "${pkgdir}/usr/etc" "${pkgdir}"
}
# vim:set ts=2 sw=2 et:
