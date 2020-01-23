# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=dbxfs
pkgver=1.0.43
pkgrel=3
pkgdesc="User-space file system for Dropbox"
arch=('i686' 'x86_64')
url="https://github.com/rianhunter/dbxfs"
license=('GPL3')
depends=('fuse2' 'python-dropbox' 'python-appdirs' 'python-userspacefs' 'python-block_tracing'
         'python-privy' 'python-keyrings-alt' 'python-sentry_sdk')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"{,.asc}
        "$pkgname.patch")
sha256sums=('7a1a21eadf1db674555c994f523bcd5537e95c532ce7af79ecad04d195f03ab9'
            'SKIP'
            'cc238c6562ec327efeba4f48e4523808338658b2b1f38b1fb6a901ba938c4868')
validpgpkeys=('584EDA5AAC13B9FBFB13F678A6A5398DACC9C15C') # Rian Hunter <rian@thelig.ht>

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
