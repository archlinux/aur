# Maintainer: Guy Boldon <gb@guyboldon.com>

_pkgname=dataclass-wizard
pkgname=python-${_pkgname}
pkgver=1.0.0
pkgrel=1
pkgdesc="This library provides a set of simple, yet elegant wizarding tools for interacting with the Python dataclasses module."
arch=('any')
url="https://github.com/rnag/dataclass-wizard"
license=('Apache-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('python-dotenv: load environment variables from .env files'
            'python-pytimeparse: parse timedelta strings'
            'python-tomli-w: TOML serialization'
            'python-yaml: YAML support')
provides=("$pkgname")
conflicts=("$pkgname")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/rnag/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('5ce5a1c5fc18bb84fd0d71f3e0ce911679a41440e94182863a5bedf8a125116f')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
