# Maintainer: Alexander Shpilkin <ashpilkin@gmail.com>

_name=hattifnatt
pkgname=python-${_name}
pkgver=0.2.1
pkgrel=1
pkgdesc="Push directory to Telegram channel"
url="https://github.com/alexshpilkin/${_name}"
arch=('any')
license=('custom:CC0')
depends=('python>=3.5'
         'python-pathtools>=0.1.2'
         'python-telegram-bot>=10.0.2'
         'python-watchdog>=0.9.0')
makedepends=('python-setuptools')
source=("https://github.com/alexshpilkin/${_name}/releases/download/v$pkgver/${_name}-$pkgver.tar.gz"
        "https://github.com/alexshpilkin/${_name}/releases/download/v$pkgver/${_name}-$pkgver.tar.gz.asc")
sha256sums=('4f10ff1f1e29590ce4bc25c7bbeecb5778bf4732118294543f0632cdc9139830'
            'SKIP')
validpgpkeys=('B595D74D6615C010469F5A1373E9AA114B3A894B')

build() {
	cd "${_name}-$pkgver"
	python setup.py build
}

package() {
	cd "${_name}-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
