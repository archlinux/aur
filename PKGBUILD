# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: David McInnis <dave@dave3.xyz>
# Contributor: jyantis <yantis@yantis.net>

# Based on python-internetarchive in [community]

_name=internetarchive
pkgname=python2-$_name
pkgver=1.9.2
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
sha256sums=('409c65fc559a9377a08a72327cf8d45dd470fc28c7bedc59bc271386198291e7')

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
