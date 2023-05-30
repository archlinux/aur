# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-google-speak
pkgver=0.2.1
pkgrel=1
pkgdesc="Simple class to create speech files using Google Translate URL"
arch=(any)
url="https://github.com/marcus67/python_google_speak"
license=(GPL3)
depends=(python-requests python-playsound)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://pypi.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('a3a169e9d1817ee6c46c3baa6af26af6d77dd7b21840eac0068454eb3ebde960abe9fc6fc73a4e141bca45bb0c9f577b06d377ead791b0cc2abd1fc671dacbd2')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
