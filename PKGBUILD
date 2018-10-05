# Maintainer: Stephan Springer <buzo+arch@Lini.de>

_pkgname=python-gnupg
pkgname=python-pretty_bad_protocol
pkgver=3.1.1
pkgrel=2
pkgdesc='Another Python 3 wrapper for GnuPG'
arch=('any')
url='https://github.com/isislovecruft/python-gnupg'
license=('GPL3')
makedepends=('python-setuptools')
depends=('python' 'gnupg')
source=("$pkgname-$pkgver.tar.gz::https://github.com/isislovecruft/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('69b74379f235a370379d0c3f890102f5fdf0b0db580a728702abdfa4be5780ba')

prepare() {
    cd "$_pkgname-$pkgver"
    sed -i "s|^versioneer.parentdir_prefix = 'pretty-bad-protocol-'|versioneer.parentdir_prefix = 'python-gnupg-'|" setup.py
}

build() {
    cd "$_pkgname-$pkgver"
    python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  rm "$pkgdir"/usr/bin/versioneer.py
  rmdir "$pkgdir"/usr/bin
}
