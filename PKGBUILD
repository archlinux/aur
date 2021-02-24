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
 cmake . -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_BATTERY=OFF -DENABLE_TINT2CONF=OFF -DENABLE_EXTRA_THEMES=OFF -DENABLE_RSVG=OFF -DENABLE_SN=OFF -DENABLE_TRACING=OFF -DENABLE_ASAN=OFF -DENABLE_BACKTRACE=OFF -DENABLE_BACKTRACE_ON_SIGNAL=OFF -DENABLE_UEVENT=OFF
 make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}
