# Maintainer: Albert Graef <aggraef at gmail dot com>
# Contributor: bjoern lindig bjoern dot lindig at googlemail dot com

pkgname=purrdata-pure
_pkgname=pd-pure
pkgver=0.26
pkgrel=1
pkgdesc="Loader plugin for the Pure programming language, Purr-Data version"
arch=('i686' 'x86_64')
url="http://purelang.bitbucket.org/"
depends=('purr-data' 'pure')
license=('custom')
source=(https://github.com/agraef/pure-lang/releases/download/$_pkgname-$pkgver/$_pkgname-$pkgver.tar.gz)
md5sums=('30d4a09542cb50e3748f09ae81d3ba79')

build() {
  cd $srcdir/$_pkgname-$pkgver
  make PD=purr-data
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  # Normally 'make PD=purr-data install' will do what we want, but since the
  # target directory /usr/lib/purr-data is actually a symlink and we're doing
  # a staged install, we have to use a bit of trickery here. Note that
  # /usr/lib/purr-data points to /opt/purr-data/lib/pd-l2ork, so the following
  # installs directly into that directory.
  make PD=pd-l2ork prefix=/opt/purr-data DESTDIR=$pkgdir install
}
