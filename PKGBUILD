# Maintainer: Antonin Godard <antonin dot godard at pm dot me>

pkgname='systemdlint'
pkgver=1.2.1
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
sha512sums=('9462a30c1126d35d45a368254a030e25a41319a86c5e208d9d21bfbd0ad92c1d17257f67637b871ba834894c97d9bf5bf0862da328159e3f81c511bafdc31cc7')

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
