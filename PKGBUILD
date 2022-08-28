# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Mufeed Ali <fushinari@protonmail.com>
# Contributor: lastweakness <lastweakness@tuta.io>
_base=cloudscraper
pkgname=python-cloudscraper
pkgver=1.2.62
pkgrel=1
pkgdesc="Python module to bypass Cloudflare's anti-bot page"
arch=('any')
url="https://github.com/VeNoMouS/${_base}"
license=('MIT')
depends=('python-pyparsing' 'python-requests' 'python-requests-toolbelt')
optdepends=('python-js2py: alternative interpreter/solver'
  'nodejs: alternative interpreter/solver')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-responses' 'python-js2py' 'nodejs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('40920e0023e5efcffd243edb7dfaf3a1b8b97a60d681ee7693e26e51d011442acd830b8d90f9a00f2902b836e9e06e272e262526cbf41d5b4cab3e4c884808ff')
b2sums=('ea8a9d5aca2187ee14ee2066b2a16d188ddac3457edd96f4e346791331299abce6554765db58374b58603dc937738ac29eaae7c57d3d2ebe3055fa27589e196e')

build() {
  cd ${_base}-${pkgver}

  python -m build --wheel --no-isolation
}

check() {
  cd ${_base}-${pkgver}

  python -m pytest -k 'not Captcha_challenge_12_12_2019 and not reCaptcha_providers'
}

package() {
  cd ${_base}-${pkgver}

  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
