# Maintainer: Max Harmathy <max.harmathy@web.de>
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Patrick McCarty <pnorcks at gmail dot com>
# Contributor: Jimmy Tang <jtang@tchpc.tcd.ie>

pkgname=pristine-tar
pkgver=1.41
pkgrel=1
pkgdesc="Tool to regenerate a pristine upstream tarball using only a small binary delta file and a copy of the source which can be a revision control checkout."
arch=('i686' 'x86_64')
url="https://packages.debian.org/sid/pristine-tar"
license=('GPL')
depends=('perl' 'xdelta' 'xdelta3')
conflicts=('pristine-tar-git')
checkdepends=('shunit2' 'diffoscope')
source=(http://ftp.debian.org/debian/pool/main/p/${pkgname}/${pkgname}_${pkgver}.tar.xz)
sha256sums=('5137b35ec3bd669d46f464b1affc95c921c11f0a27685632260a6280e470b13f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export PATH=/usr/bin/core_perl:$PATH

  perl Makefile.PL
  make
}


check() {
  cd "$srcdir/$pkgname-$pkgver"

  make test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make install DESTDIR=$pkgdir PREFIX=/usr INSTALLSITESCRIPT=/usr/bin
  install -d $pkgdir/usr/share/doc/pristine-tar
  install -D GPL TODO delta-format.txt $pkgdir/usr/share/doc/pristine-tar
  install -D -t $pkgdir/usr/share/bash-completion/completions bash_completion/pristine-tar
}

# vim:set ts=2 sw=2 et:
