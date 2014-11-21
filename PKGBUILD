# Contributor: Johannes Dewender arch at JonnyJD dot net
pkgname=acousticbrainz-client-git
_pkgname=acousticbrainz-client
_python=python
pkgver=0.1.r2.g366bdd1
pkgrel=1
pkgdesc="client to upload data to an acousticbrainz server"
arch=('any')
url="http://acousticbrainz.org/"
license=('GPL3')
depends=('essentia-acousticbrainz' 'python-requests')
makedepends=('git')
provides=()
conflicts=()
replaces=()
options=()
source=("git+https://github.com/MTG/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  # we have that in essentia-acousticbrainz
  sed -i -e "/streaming_extractor_music/d" setup.py
}

build() {
  cd "$srcdir/$_pkgname"
  $_python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  $_python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
