# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-google-speak
pkgver=0.2.2
pkgrel=1
pkgdesc="Simple class to create speech files using Google Translate URL"
arch=(any)
url="https://github.com/marcus67/python_google_speak"
license=(GPL3)
depends=(python-requests python-playsound)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://pypi.org/packages/source/${pkgname::1}/${pkgname}/${pkgname//-/_}-${pkgver}.tar.gz)
sha512sums=('21224e2b225bd7310bc84fa137bcf96b470680ca1af09aeb5b5fd546998f5c3764764081277d2a0c456e6b88e540752b167503cc91d4aa76df8fff48ebbe29b1')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
