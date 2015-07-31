# Maintainer: MadPhysicist <jfoxrabinovitz at gmail dot com>
# Contributor: Clemens Buchacher <drizzd@aon.at>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=splines
pkgname=octave-$_pack
pkgver=1.2.8
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
sha1sums=('9b4824aa26b8b49c46fe6937e46a01a25451dcc5')
md5sums=('ef569ae0257586e608bc0af54e811978')

build() {
  cd "$srcdir"
  mkdir -p builddir
  octave -q -f --eval "pkg build -verbose -nodeps builddir $_archive"
}

package() {
  mkdir -p "$pkgdir/usr/share/octave/packages"
  mkdir -p "$pkgdir/usr/lib/octave/packages"
  cp "$srcdir/builddir/$_archive" "$pkgdir/usr/share/octave/$_pack.tar.gz"
}
