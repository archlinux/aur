# Maintainer: Dani Rodríguez <dani@danirod.es>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Daniel Moch <daniel AT danielmoch DOT com>
# Contributor: gue5t <gue5t@aur.archlinux.org>
_base=Mastodon.py
pkgname=python-mastodon
pkgver=2.3.3
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
sha512sums=('0036509e27ef7cca9942c39af1b0a2a75c6e1f0a3b5483b7730f4fc867a4f09ec7b5e17452ff91615a84ca2afa9f60b01a43e4436090389ba5d3d9c20596254b')

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
