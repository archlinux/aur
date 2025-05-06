# -*- sh -*-

#  Maintainer:  Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: JustKidding <jk@vin.ovh>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
# Contributor: Alex Merry <dev@randomguy3.me.uk>

pkgname=python-stdnum
pkgver=2.0
pkgrel=1
pkgdesc='Handle, parse and validate more than 200 different standard numbers (EAN, IBAN, ISBN, etc.)'
arch=('any')
url='https://github.com/arthurdejong/python-stdnum'
license=('LGPL-2.1-or-later')  # SPDX-License-Identifier: LGPL-2.1-or-later
depends=(
  'python'
  'python-lxml'
  'python-requests'
  'python-setuptools'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
)
optdepends=(
  'python-suds: second recommended SOAP implementation'
  'python-zeep: recommended SOAP implementation'
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
)
sha256sums=('7d29974a1703a684f24bce173acd81baf5bdf5c2cba4010ac736c621867fb6e9')

build() {
  cd "$pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    ChangeLog ./*.md
}

# eof
