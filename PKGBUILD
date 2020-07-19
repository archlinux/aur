# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: David McInnis <dave@dave3.xyz>
# Contributor: jyantis <yantis@yantis.net>

# Based on python-internetarchive in [community]

_name=internetarchive
pkgname=python2-$_name
pkgver=1.9.4
pkgrel=1
pkgdesc='Wrapper for the various Internet Archive APIs (IA-S3, Metadata API, etc)'
arch=('any')
url="https://github.com/jjjake/$_name"
license=('AGPL3')
depends=('python2' 'python2-backports.csv' 'python2-docopt' 'python2-jsonpatch' 'python2-requests' 'python2-schema' 'python2-six' 'python2-tqdm')
makedepends=('python2-setuptools')
optdepends=('python2-ujson: faster json parsing'
            'python2-gevent: concurrent downloads'
            'cython2: speedups')
checkdepends=('python2-responses' 'python2-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b1833a0ab7fb73f3e9df674510c6e856db705aedaf4cb4c545017d0492af5c8b')

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
  mv "$pkgdir"/usr/bin/ia{,2}
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
}
