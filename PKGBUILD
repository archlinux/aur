# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Sherlock Holo <sherlockya@gmail.com>
# Contributor: Sean Enck <enckse@gmail.com>
# Contributor: NeoTheFox <soniczerops@gmail.com>

pkgname=python-telegram-bot
pkgver=20.1
pkgrel=1
pkgdesc="A library that provides a Python interface to the Telegram Bot API"
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
source=(${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz{,.asc})
validpgpkeys=('4CBA518847044E289548BD9FA2B984A9073022B2') # Hinrich Mahler (Key for signing releases of python-telegram-bot <22366557+Bibo-Joshi@users.noreply.github.com>
sha512sums=('c0d996ec3a89f9a1f2b644807c79dc76d66af29129830b985971d26bd58c6ba5c498818030aab32f6fcfda6173108f299b0f24a6914d1ea33525f19ba95b9b3d'
  'SKIP')

build() {
  cd ${pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
