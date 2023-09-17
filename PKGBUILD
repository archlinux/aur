# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Sebastien Leduc <sebastien@sleduc.fr>
# Contributor: Cedric Girard <girard.cedric@gmail.com>
pkgname=python-rarfile
_name=${pkgname#python-}
pkgver=4.1
pkgrel=1
pkgdesc="Python module for RAR archive reading"
arch=('any')
url="https://github.com/markokr/rarfile"
license=('ISC')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('unarchiver: alternative decompression backend'
            'libarchive: alternative decompression backend'
            'python-pycryptodome: process archives with password-protected headers')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('50cd9e283263e2b3b2762e3027f29989e0f641e8df7eb74bcba974df2f805860')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
