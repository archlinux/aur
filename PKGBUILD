# Contributor: Eli Schwartz <eschwartz@archlinux.org>

_pkgname=cloudscraper
pkgname=python-cloudscraper
pkgver=1.2.60
pkgrel=1
pkgdesc="Python module to bypass Cloudflare's anti-bot page"
arch=('any')
url="https://github.com/VeNoMouS/${_pkgname}"
license=('MIT')
depends=('python-pyparsing' 'python-requests' 'python-requests-toolbelt')
optdepends=('python-js2py: alternative interpreter/solver'
            'nodejs: alternative interpreter/solver')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-responses' 'python-js2py' 'nodejs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('426bb95330817ed936129f004b3e5091567be011b08a675e6b37c0bdec43e4c6')
b2sums=('d4c69189104a433c044de9f60ce4d15c82f65f4bbfab2350f0e4603703c080a9adb439a6634da94e511ba2e100543ed4a7c7aad2c5b83f061cb04e06d4e3c294')

build(){
  cd ${_pkgname}-${pkgver}

  python -m build --wheel --no-isolation
}

check() {
  cd ${_pkgname}-${pkgver}

  python -m pytest -k 'not test_getCookieString_challenge_js_challenge1_16_05_2020'
}

package() {
  cd ${_pkgname}-${pkgver}

  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
