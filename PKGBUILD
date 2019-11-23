# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=dbxfs
pkgver=1.0.43
pkgrel=2
pkgdesc="User-space file system for Dropbox"
arch=('i686' 'x86_64')
url="https://github.com/rianhunter/dbxfs"
license=('GPL3')
depends=('fuse2' 'python-dropbox' 'python-appdirs' 'python-userspacefs' 'python-block_tracing' 
         'python-privy' 'python-keyrings-alt' 'python-sentry_sdk')
makedepends=('python-setuptools')
replaces=('python-dbxfs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rianhunter/$pkgname/archive/v$pkgver.tar.gz"
        "$pkgname.patch")
sha256sums=('9bf6738968c09edb650accb8ff7e6ee9b48d44ac31b95f5fcf0cdc06331cde05'
            'cc238c6562ec327efeba4f48e4523808338658b2b1f38b1fb6a901ba938c4868')

prepare() {
	cd $pkgname-$pkgver
	
	# Disable update check
	patch -Np1 -i "$srcdir/$pkgname.patch"
}

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
