# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=dbxfs
pkgver=1.0.64
pkgrel=2
pkgdesc="User-space file system for Dropbox"
arch=('x86_64')
url="https://thelig.ht/code/dbxfs"
license=('GPL3')
depends=('fuse2' 'python-dropbox' 'python-appdirs' 'python-userspacefs'
         'python-block_tracing' 'python-privy' 'python-keyrings-alt' 'python-sentry_sdk'
         'python-setuptools')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
        "$pkgname.patch")
sha256sums=('07d72a853a5ddffd5440fe8168ffa7adaef148d09a77b4f56be5d7274a373405'
            'cc238c6562ec327efeba4f48e4523808338658b2b1f38b1fb6a901ba938c4868')

prepare() {
  cd $pkgname-$pkgver

  # Disable update check
  patch -Np1 -i "$srcdir/$pkgname.patch"
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
