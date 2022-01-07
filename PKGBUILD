# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Sebastien Leduc <sebastien@sleduc.fr>
# Contributor: Cedric Girard <girard.cedric@gmail.com>
pkgname=python-rarfile
_name=${pkgname#python-}
pkgver=4.0
pkgrel=1
pkgdesc="Python module for RAR archive reading"
arch=('any')
url="https://github.com/markokr/rarfile"
license=('ISC')
depends=('python')
makedepends=('python-setuptools')
optdepends=('unarchiver: alternative decompression backend'
            'libarchive: alternative decompression backend'
            'python-crypto: process archives with password-protected headers')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('67548769229c5bda0827c1663dce3f54644f9dbfba4ae86d4da2b2afd3e602a1')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
