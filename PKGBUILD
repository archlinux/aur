# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Daniel Moch <daniel AT danielmoch DOT com>
# Contributor: gue5t <gue5t@aur.archlinux.org>
_name=Mastodon.py
pkgname=python-mastodon
pkgver=1.5.1
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
         python-blurhash
         python-cryptography
         python-http-ece)
makedepends=(python-setuptools)
checkdepends=(python-pytest
              python-pytest-runner
              python-pytest-cov
              python-vcrpy
              python-pytest-mock
              python-requests-mock
              python-pytest-vcr)
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('2afddbad8b5d7326fcc8a8f8c62bfe956e34627f516b06c6694fc8c8fedc33ee')

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
