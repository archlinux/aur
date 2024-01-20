# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=dbxfs
pkgver=2.0.0
pkgrel=1
pkgdesc="User-space file system for Dropbox"
arch=('x86_64')
url="https://thelig.ht/code/dbxfs"
license=('GPL-3.0-or-later')
depends=(
  'fuse2'
  'python-block_tracing'
  'python-dropbox'
  'python-platformdirs'
  'python-privy'
  'python-sentry_sdk'
  'python-userspacefs'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
        'update-check.patch')
sha256sums=('b24299903040d621818cbbb0f4aaa81386c0cf2eb6c7d069c417508a7903a2c4'
            'b00af1f372b4f420d4e2cb8bf446e5e654db74aeee32636e008cab537968c755')

prepare() {
  cd $pkgname-$pkgver

  # Redirect to AUR page for update URL
  patch -Np1 -i "$srcdir/update-check.patch"
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
