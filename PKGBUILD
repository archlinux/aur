# Maintainer: Johannes Dewender   arch at JonnyJD dot net
# Contributor: Frederik "Freso" S. Olesen <archlinux@freso.dk>
pkgname=isrcsubmit
pkgver=2.1.0
pkgrel=1
pkgdesc="submit ISRCs from disc to MusicBrainz"
arch=('any')
url="http://jonnyjd.github.io/musicbrainz-isrcsubmit/"
license=('GPL3')
depends=('python' 'python-musicbrainzngs>=0.4' 'python-discid>=1.0.0')
makedepends=('python-setuptools' 'python-sphinx')
conflicts=()
optdepends=(
"python-keyring: storing login information"
"cdrdao: read ISRCs also from CD-Text"
)
options=(!emptydirs)
source=(http://isrcsubmit.jonnyjd.net/downloads/isrcsubmit-$pkgver.tar.gz)
md5sums=('2f0bff1d85662ad28920618dd9e6fa7d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --skip-build --root="$pkgdir/" --optimize=1
  install -d "$pkgdir/usr/share/doc/$_pkgname"
  install -m644 -t "$pkgdir/usr/share/doc/$_pkgname" AUTHORS CHANGES.* COPYING README.*
}

# vim:set ts=2 sw=2 et:
