# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Daniel Micay <danielmicay@gmail.com>

pkgname=libseccomp-git
pkgver=2.5.0.r13.g3734fdc
pkgrel=1
pkgdesc="Interface to the Linux Kernel's syscall filtering mechanism"
arch=('i686' 'x86_64')
url="https://github.com/seccomp/libseccomp"
license=('LGPL')
depends=('glibc')
makedepends=('git' 'gperf')
provides=('libseccomp')
conflicts=('libseccomp')
options=('staticlibs')
source=("git+https://github.com/seccomp/libseccomp.git")
sha256sums=('SKIP')


pkgver() {
  cd "libseccomp"

  _tag=$(git tag -l --sort -v:refname | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "libseccomp"

  ./autogen.sh
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "libseccomp"

  #make check
}

package() {
  cd "libseccomp"

  make DESTDIR="$pkgdir" install
}
