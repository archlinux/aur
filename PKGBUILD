# Contributor: Johannes Dewender arch at JonnyJD dot net
pkgname=acousticbrainz-client
_python=python
pkgver=0.1
pkgrel=1
pkgdesc="client to upload data to an acousticbrainz server"
arch=('any')
url="http://acousticbrainz.org/"
license=('GPL3')
depends=('essentia-acousticbrainz' 'python-requests')
makedepends=('git')
conflicts=('acousticbrainz-client-git')
source=("https://github.com/MTG/$pkgname/archive/${pkgver}.tar.gz")
sha256sums=('cc5b40591ecf54fb5f3c185fc0e9f350a6a29e9e38ba81a0175641e2e570caba')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  # we have that in essentia-acousticbrainz
  sed -i -e "/streaming_extractor_music/d" setup.py
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  $_python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  $_python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
