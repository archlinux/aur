# Maintainer: Frederik "Freso" S. Olesen <archlinux@freso.dk>
# Contributor: Johannes Dewender   arch at JonnyJD dot net
pkgbase=isrcsubmit-git
pkgname=$pkgbase
true && pkgname=('isrcsubmit-python2-git' 'isrcsubmit-python-git')
pkgver=2.0.0.beta.3
pkgver(){
  cd $srcdir/$pkgbase
  git describe --tags --long | sed 's/-/./g;s/^v//'
}
epoch=1
pkgrel=1
pkgdesc="submit ISRCs from disc to MusicBrainz"
arch=('any')
url="https://github.com/JonnyJD/musicbrainz-isrcsubmit"
license=('GPL3')
makedepends=('git' 'python-distribute' 'python2-distribute')
provides=('isrcsubmit')
conflicts=('isrcsubmit')
options=(!emptydirs)
source=($pkgbase::git+https://github.com/JonnyJD/musicbrainz-isrcsubmit.git)
md5sums=('SKIP')

prepare() {
  rm -rf $srcdir/$pkgbase-python2
  git clone $pkgbase $pkgbase-python2
}

build() {
  cd $pkgbase
  python setup.py build

  cd $srcdir/$pkgbase-python2
  python2 setup.py build

}

package_isrcsubmit-python-git() {
  depends=('python' 'python-musicbrainzngs>=0.4' 'python-discid>=0.5.0')
  cd $srcdir/$pkgbase
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_isrcsubmit-python2-git() {
  depends=('python2' 'python2-musicbrainzngs>=0.4' 'python2-discid>=0.5.0')
  cd $srcdir/$pkgbase-python2
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
