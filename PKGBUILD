# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: David McInnis <dave@dave3.xyz>
# Contributor: jyantis <yantis@yantis.net>

# Based on python-internetarchive in [community]

_name=internetarchive
pkgname=python2-$_name
pkgver=1.9.0
pkgrel=1
pkgdesc='Wrapper for the various Internet Archive APIs (IA-S3, Metadata API, etc)'
arch=('any')
url="https://github.com/jjjake/$_name"
license=('AGPL3')
depends=('python2' 'python2-backports.csv' 'python2-clint' 'python2-docopt' 'python2-jsonpatch' 'python2-requests' 'python2-schema' 'python2-six')
makedepends=('python2-setuptools')
optdepends=('python2-ujson: faster json parsing'
            'python2-gevent: concurrent downloads'
            'cython2: speedups')
checkdepends=('python2-responses' 'python2-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('20d1a4aef5835dc73d24fa6f6af36a07a46577789806a1513b175d7696cc2a7a')

build() {
  cd "$_name-$pkgver"

  python2 setup.py build
}

check() {
  cd "$_name-$pkgver"

  python2 setup.py test
}

package() {
  cd "$_name-$pkgver"

  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
}
