# Maintainer: Frederik "Freso" S. Olesen <archlinux@freso.dk>
# Contributor: Johannes Dewender   arch at JonnyJD dot net
pkgname=isrcsubmit-git
pkgver=2.0.0.beta.4.4.g2fd25e2
pkgver(){
  cd "$srcdir/$pkgname"
  git describe --tags --long | sed 's/-/./g;s/^v//'
}
pkgrel=1
pkgdesc="submit ISRCs from disc to MusicBrainz"
arch=('any')
url="https://github.com/JonnyJD/musicbrainz-isrcsubmit"
license=('GPL3')
depends=('python' 'python-musicbrainzngs>=0.4' 'python-discid>=1.0.0')
makedepends=('git' 'python-setuptools' 'python-sphinx')
provides=('isrcsubmit')
conflicts=('isrcsubmit')
replaces=('isrcsubmit-python2-git' 'isrcsubmit-python-git')
options=(!emptydirs)
source=("$pkgname::git+https://github.com/JonnyJD/musicbrainz-isrcsubmit.git")
md5sums=('SKIP')

build() {
  cd "$pkgname"
  python setup.py build
}

check() {
  cd "$pkgname"
  python setup.py test
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
