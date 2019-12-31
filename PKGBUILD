# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Simon Chabot <simon dot chabot at etu dot utc dot fr>
# Contributor: Christopher Loen <christopherloen at gmail dot com>
# Contributor: David McInnis <davidm@eagles.ewu.edu>

pkgname=python-exifread
_name="exif-py"
pkgver=2.2.0
pkgrel=2
pkgdesc="Python library to extract EXIF data from tiff and jpeg files"
arch=('any')
url="https://github.com/ianare/exif-py"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
# 2.2.0 was not properly uploaded to PyPi, download the tarball from project's
# release page instead: https://github.com/ianare/exif-py/issues/97
source=("$pkgname-$pkgver.tar.gz::https://github.com/ianare/$_name/archive/$pkgver.tar.gz"
        "fix-warning-list-for-qualifier.patch")
sha1sums=('eec3d5f355a210d78409ec91dee2b794e482410a'
          '94e870d0f0beb3b31b0cac08d46202950bc89385')
sha256sums=('55b8dbdfa1c55da50a0b989cbcd591bb996f36adff27cc207b350b25d76d2828'
            '511417020ddbe39d2f28a8a20515de3d126bada0e700a34ab5018a86c594bd2a')

prepare() {
  cd "$_name-$pkgver"
  patch -p0 -i "$srcdir/fix-warning-list-for-qualifier.patch"
}

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
