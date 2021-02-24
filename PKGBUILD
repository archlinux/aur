# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Black_Codec <orso.f.regna@gmail.com>

pkgname=tint2-minimal-git
_pkgname=tint2
pkgrel=1
pkgver=0.12.1.r44.g1f7f197
pkgdesc="Git official release"
arch=('i686' 'x86_64')
url="https://gitlab.com/o9000/tint2"
license=('GPL')
depends=('gtk2' 'imlib2')
optdepends=('startup-notification: startup notification support'
	    'lxappearance: theme tweaker')
makedepends=('cmake')
install=${pkgname}.install
provides=('tint2')
conflicts=('tint2' 'tint' 'tint2-svn')
source=("git+https://gitlab.com/o9000/tint2.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
 cd "$srcdir/$_pkgname"
 cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_ENABLE_BATTERY=OFF -DCMAKE_ENABLE_TINT2CONF=OFF -DCMAKE_ENABLE_EXTRA_THEMES=OFF -DCMAKE_ENABLE_RSVG=OFF -DCMAKE_ENABLE_SN=OFF -DCMAKE_ENABLE_TRACING=OFF -DCMAKE_ENABLE_ASAN=OFF -DCMAKE_ENABLE_BACKTRACE=OFF -DCMAKE_ENABLE_BACKTRACE_ON_SIGNAL=OFF -DCMAKE_ENABLE_UEVENT=OFF
 make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}
