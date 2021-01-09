# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libffi-minimal-git
pkgver=3.2.1.r334.g4fdbb05
pkgrel=1
pkgdesc="Portable foreign function interface library"
arch=('i686' 'x86_64')
url="https://sourceware.org/libffi/"
license=('MIT')
depends=('glibc')
makedepends=('git')
#checkdepends=('dejagnu')
provides=('libffi')
conflicts=('libffi')
options=('staticlibs')
source=("git+https://github.com/libffi/libffi.git")
sha256sums=('SKIP')


pkgver() {
  cd "libffi"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libffi"

  ./autogen.sh
  ./configure --prefix="/usr" --enable-pax_emutramp --disable-docs --disable-debug
  make
}

#check() {
#  cd "libffi"

#  make check
#}

package() {
  cd "libffi"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/libffi/LICENSE"
}
