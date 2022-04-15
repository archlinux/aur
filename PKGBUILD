# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Sebastien Leduc <sebastien@sleduc.fr>
# Contributor: Cedric Girard <girard.cedric@gmail.com>
pkgname=python-rarfile
_name=${pkgname#python-}
pkgver=4.0
pkgrel=2
pkgdesc="Python module for RAR archive reading"
arch=('any')
url="https://github.com/markokr/rarfile"
license=('ISC')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('unarchiver: alternative decompression backend'
            'libarchive: alternative decompression backend'
            'python-crypto: process archives with password-protected headers')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('67548769229c5bda0827c1663dce3f54644f9dbfba4ae86d4da2b2afd3e602a1')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
