# Contributor: Johannes Dewender   arch at JonnyJD dot net
pkgname=bzr-builddeb
_python=python2
pkgver=2.8.4
pkgrel=1
pkgdesc="bzr plugin for Debian package management"
arch=('any')
url="http://jameswestby.net/bzr/builddeb/"
license=('GPL2')
depends=('bzr>=2.1' 'devscripts' 'dpkg' 'patchutils' 'pristine-tar' 'quilt' 'python2-debian>=0.1.11' 'python2-apt')
optdepends=('bzr-svn: Subversion integration' 'python2-lzma: liblzma bindings')
makedepends=()
conflicts=()
options=(!emptydirs)
source=("http://ftp.debian.org/debian/pool/main/b/$pkgname/${pkgname}_$pkgver.tar.gz")
md5sums=('606b9f93609ac42cc91e47ecf89bc15c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  $_python setup.py build
  dir="build/lib/bzrlib/plugins/builddeb"
  for file in "$dir/"{merge_changelog,tests/test_merge_package}.py; do
    sed -i -e '1s|/usr/bin/env python$|/usr/bin/env python2|' $file
  done
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  $_python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
