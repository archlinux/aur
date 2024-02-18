# Maintainer: Antonin Godard <antonin dot godard at pm dot me>

pkgname='systemdlint'
pkgver=1.3.1
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
sha512sums=('4bddbf44a05006e8937568c3da64056403de0df24f96eed1e4e85c2bcde1e12510b4a497ecc8cb5af6ef1348eedf022190a2d26aa489f8f1c93ad96e77b9127b')

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
