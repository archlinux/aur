# Maintainer: Daniel Moch <daniel AT danielmoch DOT com>
# Contributor: gue5t <gue5t@aur.archlinux.org>
_name=Mastodon.py
pkgname=python-mastodon
pkgver=1.5.0
pkgrel=1
pkgdesc="python bindings for the Mastodon RPC API"
arch=('any')
url="https://github.com/halcy/Mastodon.py"
license=('MIT')
depends=(python
         python-magic-ahupp
         python-requests
         python-dateutil
         python-six
         python-pytz
         python-decorator
         python-blurhash)
makedepends=(python-setuptools)
checkdepends=(python-pytest
              python-pytest-runner
              python-pytest-cov
              python-vcrpy
              python-pytest-mock
              python-requests-mock
              python-pytest-vcr)
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('80701e37ca27586266fce4a1e23e1b910b883fe2c28ce9c43a16de30cb77d757')

build() {
  cd ${_name}-${pkgver}
  python setup.py build
}

check() {
  cd ${_name}-${pkgver}
  python -m pytest
}

package() {
  cd ${_name}-${pkgver}
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python ./setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim: set sts=2 sw=2 ft=PKGBUILD et:
