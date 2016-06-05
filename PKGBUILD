# Maintainer: MadPhysicist <jfoxrabinovitz at gmail dot com>
# Contributor: Clemens Buchacher <drizzd@aon.at>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=splines
pkgname=octave-$_pack
pkgver=1.3.1
pkgrel=1
pkgdesc="Additional spline functions."
arch=(any)
url="http://octave.sourceforge.net/$_pack/"
license=('custom')
groups=('octave-forge')
depends=('octave>=3.6.0')
makedepends=()
optdepends=()
backup=()
options=()
install=$pkgname.install
_archive=$_pack-$pkgver.tar.gz
source=("http://downloads.sourceforge.net/octave/$_archive")
noextract=("$_archive")
sha1sums=('bec64b727eb3f5af4f5f9e4496b80103c3f11651')
md5sums=('c57f1de6211d512b572b563c211e7091')

build() {
  cd "$srcdir"
  mkdir -p builddir
  octave-cli -q -f --eval "pkg build -verbose -nodeps builddir $_archive"
}

package() {
  mkdir -p "$pkgdir/usr/share/octave/packages"
  mkdir -p "$pkgdir/usr/lib/octave/packages"
  cp "$srcdir/builddir/$_archive" "$pkgdir/usr/share/octave/$_pack.tar.gz"
}
