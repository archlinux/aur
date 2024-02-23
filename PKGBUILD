# Maintainer: sunplan
pkgname=nndownload
pkgver=1.15
pkgrel=1
pkgdesc='Download and process links from Niconico (nicovideo.jp)'
arch=('any')
url='https://github.com/AlexAplin/nndownload'
license=('MIT')
depends=('python'
         'python-aiohttp'
         'python-aiohttp-socks'
         'python-beautifulsoup4'
         'python-requests'
         'python-mutagen')
makedepends=('python-setuptools'
             'dos2unix')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('ba580c51a0cb9ceaa9ce1437753937ba038649cf3629d034fd938454fa577f54')

prepare() {
	# > nndownload.py
	# /usr/bin/env: 'python\r': No such file or directory
	dos2unix $pkgname-$pkgver/nndownload/nndownload.py
}

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
