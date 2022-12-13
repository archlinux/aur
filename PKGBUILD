# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Sherlock Holo <sherlockya@gmail.com>
# Contributor: Sean Enck <enckse@gmail.com>
# Contributor: NeoTheFox <soniczerops@gmail.com>

pkgname=python-telegram-bot
pkgver=20.0a6
pkgrel=1
pkgdesc="A pure Python interface for the Telegram Bot API"
url="https://github.com/${pkgname}/${pkgname}"
license=(GPL3 LGPL)
arch=(any)
depends=(python-httpx)
makedepends=(python-setuptools)
# checkdepends=(python-pytest-asyncio python-pytest-timeout python-flaky python-beautifulsoup4)
optdepends=('python-cryptography: for support cryptography library'
  'python-tornado: for webhooks support'
  'python-cachetools: for use a variant of LRUCache'
  'python-apscheduler: for job queue support'
  'python-pytz: for job queue support')
# 'python-aiolimiter: for rate limiter'
source=(${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz) # {,.asc}
# validpgpkeys=('655BB4F56CDB0E0E4500CF572E9E0E127EF3F283') # Hinrich Mahler <hinrich.mahler@freenet.de>
sha512sums=('0eda9552b7d7f17bb783fcc29f89b372e597f01167939651cf649d3bc6b1603384b38c4d88add500dec18813cf303c4c93c4e0a64f7f9116ba361e01789a7518')

build() {
  cd ${pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
