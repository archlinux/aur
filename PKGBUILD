# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-museval
_gitpkgname=sigsep-mus-eval
pkgver=0.4.0
pkgrel=1
pkgdesc='Source separation evaluation tools for Python'
arch=('any')
url='https://github.com/sigsep/sigsep-mus-eval'
license=('MIT')
depends=(
  'ffmpeg'
  'python-jsonschema'
  'python-musdb'
  'python-pandas'
  'python-scipy'
  'python-simplejson'
)
checkdepends=('python-pytest')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/sigsep/sigsep-mus-eval/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  '45eaefc5f5b342edea49f7b12c4987522ba5f7c835b0a1c89111014b5afc7d5c3f78a1274d5700d16843a53fb3e251c2412689bda38938d0f30d55e0b2902886'
)

build() {
    cd "${srcdir}/${_gitpkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${_gitpkgname}-${pkgver}"
    python -m pytest tests/
}

package() {
    cd "${srcdir}/${_gitpkgname}-${pkgver}"
    python -I -m installer --destdir="${pkgdir}" dist/*.whl
    install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
