# Maintainer: Antonin Godard <antonin dot godard at pm dot me>

pkgname='systemdlint'
pkgver=1.3.0
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
sha512sums=('5fd7f6501ad19cfa1ee25e6b7481f85ef4d154a837711209da182ddf22e8b704b3f6a892a8d4527332bd14be70b55e7e562a2d510d888d4cdd39722834ad6779')

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
