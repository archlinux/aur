# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Sherlock Holo <sherlockya@gmail.com>
# Contributor: Sean Enck <enckse@gmail.com>
# Contributor: NeoTheFox <soniczerops@gmail.com>

pkgname=python-telegram-bot
pkgver=20.0
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
sha512sums=('7bdfb5aa2d7f074639814a87eb4e18c7a247d56aafa2c3656ebcd7857960453c5a43e0aabbf140cd68aab01aa248ae16dd5848688a886a825da019ce75f220c2')

build() {
  cd ${pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
