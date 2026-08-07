# Maintainer: Dani Rodríguez <dani@danirod.es>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Daniel Moch <daniel AT danielmoch DOT com>
# Contributor: gue5t <gue5t@aur.archlinux.org>
_base=Mastodon.py
pkgname=python-mastodon
pkgver=2.2.2
pkgrel=2
pkgdesc="Python wrapper for the Mastodon API"
arch=(any)
url="https://github.com/halcy/${_base}"
license=(MIT)
depends=(python-requests python-dateutil python-decorator)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=(
  'python-cryptography: webpush support'
  'python-graphemeu: support for the get_status_length function, if required'
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
    python-graphemeu
    python-halcy-blurhash
    python-http-ece
    python-magic
)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('c33f16170a34bb404190a32c2607739b9d22bc8c88906b36e513ec75a026dc03a25283db1b5f0901fba0787a6765090cd37e7caab7a48f4fe110e5716ee800c9')

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
