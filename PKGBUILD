# Contributor: Johannes Dewender arch at JonnyJD dot net
pkgname=acousticbrainz-client-git
_pkgname=acousticbrainz-client
_python=python2
pkgver=r36.58014e9
pkgrel=1
pkgdesc="client to upload data to an acousticbrainz server"
arch=('x86_64' 'i686')
url="http://acousticbrainz.org/"
license=('GPL3')
depends=('python2-requests')
makedepends=('git')
provides=()
conflicts=()
replaces=()
options=()
source=("git+https://github.com/MTG/$_pkgname.git")
md5sums=('SKIP')

# use binary essentia for now
_EXT_HASH=21ef5f41f15ed1f80c8f9b36802430055d3b93e9
_EXT="http://acousticbrainz.org/static/download/essentia-extractor-$_EXT_HASH-linux-$CARCH"
source+=("$_EXT.tar.gz")
if [ "$CARCH" = "x86_64" ]; then
  md5sums+=('4aabb509dfc86530cdbecbdfdff6ab7d')
else
  md5sums+=('4fd57bc2fd9ed3755d62b016c72e68bc')
fi

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_EXT"
  cp streaming_extractor_music ../$_pkgname
  cd "$srcdir/$_pkgname"
  $_python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  $_python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
