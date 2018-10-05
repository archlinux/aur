# Maintainer: Albert Graef <aggraef at gmail dot com>

pkgname=purrdata-faust
_pkgname=pd-faust
pkgver=0.17
pkgrel=1
pkgdesc="Run Faust signal processors in Pd, Purr-Data version"
arch=('i686' 'x86_64')
url="http://purelang.bitbucket.org/"
depends=('purr-data' 'pure'  'purrdata-pure' 'pure-faust' 'pure-audio' 'pure-midi' 'pure-stldict')
makedepends=('faust')
license=('LGPL3')
source=(https://github.com/agraef/pure-lang/releases/download/$_pkgname-$pkgver/$_pkgname-$pkgver.tar.gz)
md5sums=('40f6be65917051dd3a46c35020d2dfa9')

build() {
  cd $srcdir/$_pkgname-$pkgver
  make PD=purr-data PUREC_FLAGS=-mcpu=generic
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
