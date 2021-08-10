# Maintainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>

pkgname=mce
pkgver=0_git20200916
_commit="4b7cb5348b3edafb6712c97a2be5f34f8401c68f"
pkgrel=1
pkgdesc="mce with support for tap-to-wake and tilt-to-wake."
url="https://github.com/AsteroidOS/mce"
arch=(any)
license=(GPL)
depends=(libiphb) 
makedepends=()
checkdepends=()
groups=(mer)
source=("https://github.com/AsteroidOS/mce/archive/$_commit/mce-$_commit.tar.gz"
        "fix-build.patch"
        "makefile.patch")
sha256sums=('SKIP'
            'dc5e2b15f886611787fa62fd60a7bc76bc4b703a08ae51833482b9a7484f7768'
            '6a0bff6641feb52323139064b45b98a1ee389b564d3f64960d78bfc94f7e96ca')

 build() {
  cd $pkgname-$_commit
  DESTDIR=$pkgdir PREFIX=/usr _UNITDIR=/usr/lib/systemd make
 }

package() {
  cd $pkgname-$_commit
  make DESTDIR=$pkgdir PREFIX=/usr install
  mv $pkgdir/lib $pkgdir/usr/lib
  mv $pkgdir/usr/sbin $pkgdir/usr/bin
}
