# Maintainer: Evgeniy Filimonov <evgfilim1@gmail.com>

pkgname='python-aiogram'
pkgver=2.4
pkgrel=1
pkgdesc="A pretty simple and fully asynchronous library for Telegram Bot API written in Python 3.7 with asyncio and aiohttp"
arch=('any')
url="https://github.com/aiogram/aiogram"
license=('MIT')
depends=('python>=3.7' 'python-aiohttp>=3.5.4' 'python-aiohttp<4.0.0' 'python-babel>=2.6.0' 'python-certifi>=2019.3.9')
makedepends=(
    'python-setuptools'
#    'python-pip'
)
optdepends=(
    'python-uvloop: fast, drop-in replacement of the built-in asyncio event loop'
    'python-ujson: ultra fast JSON encoder and decoder written in pure C'
    'python-rapidjson: extremely fast C++ JSON parser and serialization library'
    'python-emoji: emojize and demojize support'
    'python-aioredis: Redis storage support'
    'python-aiohttp-socks: SOCKS4(a) and SOCKS5 proxy support'
#    'python-rethinkdb: RethinkDB storage support'  # No such package yet
)
source=("https://github.com/aiogram/aiogram/archive/v${pkgver}.tar.gz"
        "no-pip.patch")
sha256sums=('ddaf49d6f1c38d597102eadd280c77ad26b451e4606464a72f42d43e227ae7e7'
            '6279e16e20acbae3e289cd0e5ba89db199753f35afa5201e3e8adbcd9c1653bb')

prepare() {
    patch -u "$srcdir/aiogram-${pkgver}/setup.py" no-pip.patch
}

build() {
	cd "$srcdir/aiogram-${pkgver}"
	python setup.py build
}

package() {
	cd "$srcdir/aiogram-${pkgver}"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim: ft=sh ts=4 sw=4 et 

