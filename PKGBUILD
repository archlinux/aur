# Maintainer: Dani Rodríguez <dani@danirod.es>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Daniel Moch <daniel AT danielmoch DOT com>
# Contributor: gue5t <gue5t@aur.archlinux.org>
_base=Mastodon.py
pkgname=python-mastodon
pkgver=2.2.1
pkgrel=1
pkgdesc="Python wrapper for the Mastodon API"
arch=(any)
url="https://github.com/halcy/${_base}"
license=(MIT)
depends=(python-requests python-dateutil python-decorator)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=(
  'python-cryptography: webpush support'
  'python-grapheme: support for the get_status_length function, if required'
  'python-halcy-blurhash: support for blurring medias using blurhash'
  'python-http-ece: webpush support'
  'python-magic: use libmagic for file type identification'
)
checkdepends=(
    python-pytest-runner
    python-pytest-cov
    python-vcrpy
    python-pytest-recording
    python-pytest-mock
    python-requests-mock
    python-pytz

    python-cryptography
    python-grapheme
    python-halcy-blurhash
    python-http-ece
    python-magic
)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('a8c8ff4ffe8b4981eb8bf4d1d2bb8173383a295cbd4354c4576f91279d1c81eb243289022a64c6c60907665104b4790237442ac40869f469d2f00205c3cc2e19')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
