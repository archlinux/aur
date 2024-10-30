# Maintainer: Antonin Godard <antonin dot godard at pm dot me>

pkgname='systemdlint'
pkgver=1.3.3
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
sha512sums=('3762c73f3fd18a3af415a50e1e3ae539fc2127a11ac68b2fe194be4004cd8efc6f38889a29be1c664aa7e41452c5e4d0ad6f158c73bffb1fca61bbbbdc8b18bb')

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
