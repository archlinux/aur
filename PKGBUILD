# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Sherlock Holo <sherlockya@gmail.com>
# Contributor: Sean Enck <enckse@gmail.com>
# Contributor: NeoTheFox <soniczerops@gmail.com>

pkgname=python-telegram-bot
pkgver=20.7
pkgrel=1
pkgdesc="A library that provides a Python interface to the Telegram Bot API"
url="https://github.com/${pkgname}/${pkgname}"
license=(GPL3 LGPL)
arch=(any)
depends=(python-httpx)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest-asyncio python-pytest-timeout python-flaky python-beautifulsoup4)
optdepends=('python-cryptography: for support cryptography library'
  'python-tornado: for webhooks support'
  'python-cachetools: for use a variant of LRUCache'
  'python-apscheduler: for job queue support'
  'python-pytz: for job queue support')
# 'python-aiolimiter: for rate limiter'
source=(${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz{,.asc})
validpgpkeys=('4CBA518847044E289548BD9FA2B984A9073022B2') # Hinrich Mahler (Key for signing releases of python-telegram-bot <22366557+Bibo-Joshi@users.noreply.github.com>
sha512sums=('347d65142695e52cc22329b31f446103f21df865ffa2f9c5e7fa0ea2b0b4228ad00e992b0ab100a3885585bc471968e09a5a624c824c7bb6dce27e0d6c85b63d'
            'SKIP')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
