# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=dash-git
pkgver=0.5.10.2.r18.g03cbaba
pkgrel=1
pkgdesc="A POSIX compliant shell that aims to be as small as possible"
arch=('i686' 'x86_64')
url="http://gondor.apana.org.au/~herbert/dash/"
license=('BSD')
depends=('glibc')
makedepends=('git')
provides=('dash')
conflicts=('dash')
install=dash.install
source=("git+https://git.kernel.org/pub/scm/utils/dash/dash.git")
sha256sums=('SKIP')


pkgver() {
  cd "dash"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "dash"

  ./autogen.sh
  ./configure --prefix="/usr" --enable-fnmatch --with-libedit

  make
}

package() {
  cd "dash"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/dash/COPYING"
}
