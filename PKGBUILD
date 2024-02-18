# Maintainer: Antonin Godard <antonin dot godard at pm dot me>

pkgname='systemdlint'
pkgver=1.3.2
pkgrel=1
pkgdesc='Linter for systemd unit files'
url='https://github.com/priv-kweihmann/systemdlint'
arch=('any')
license=('BSD 2-Clause')
depends=(
  'python-anytree>=2.6.0'
  'python-systemdunitparser>=0.1'
)
makedepends=(
  'python-setuptools'
)
provides=("${pkgname}=${pkgver}")
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('df5a6b139216fbe54850b33e3d22fa07cad5d395478e36b1f7b12b1c64b32326d18d56fcdad5ca52736d55b0e273841fba3697b38edb4a7111173225371b9276')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/systemdlint"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  (cd systemdlint && python setup.py install --root="$pkgdir" --optimize=1 )
  install -Dm 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=PKGBUILD ts=2 sw=2 et:
