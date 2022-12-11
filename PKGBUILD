# Maintainer: sunplan
pkgname=nndownload
pkgver=1.12.2
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
sha256sums=('6ee4d16abe376eaf79f3a1e25d15786cd62688eceadbfff3eb1f096d27849f23')

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
