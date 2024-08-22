# Maintainer: sunplan
pkgname=nndownload
pkgver=1.18
pkgrel=1
pkgdesc='Download and process links from Niconico (nicovideo.jp)'
arch=('any')
url='https://github.com/AlexAplin/nndownload'
license=('MIT')
depends=('python'
         'python-aiohttp'
         'python-aiohttp-socks'
         'python-beautifulsoup4'
         'python-ffmpeg-python'
         'python-mutagen'
         'python-mutagen'
         'python-requests'
         'python-rich')
makedepends=('python-setuptools'
             'dos2unix')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('f4cd35fa44c61ffbce6fa654d9711ec27b90d9d81acc74d4d642775365a9bbad')

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
