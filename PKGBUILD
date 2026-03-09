# Maintainer: Antonin Godard <antonin dot godard at pm dot me>

pkgname='systemdlint'
pkgver=1.4.0
pkgrel=1
pkgdesc='Linter for systemd unit files'
url='https://github.com/priv-kweihmann/systemdlint'
arch=('any')
license=('BSD 2-Clause')
depends=(
  'python-anytree>=2.13'
  'python-systemdunitparser>=0.4'
)
makedepends=(
  python-build
  python-setuptools
)
provides=("${pkgname}=${pkgver}")
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('68f4648a72c6d1bf963c35930af050f5aa8023d1613b2adf0b41381e53f6c571f4adde71d5da79ab9f9b979e1fab3b6a84511e2e955fc84aebe777511b138acd')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation -x
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=PKGBUILD ts=2 sw=2 et:
