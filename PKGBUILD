# Contributor: Johannes Dewender arch at JonnyJD dot net
pkgname=acousticbrainz-client-git
_pkgname=acousticbrainz-client
_python=python
pkgver=r56.d49bfb6
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
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
