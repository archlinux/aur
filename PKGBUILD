# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libnl-git
pkgver=3.12.0.r8.g655a638d
pkgrel=1
pkgdesc="A collection of libraries providing APIs to netlink protocol based Linux kernel interfaces"
arch=('i686' 'x86_64')
url="https://www.infradead.org/~tgr/libnl/"
license=('LGPL-2.1-or-later')
depends=('glibc' 'libgcc')
makedepends=('git')
provides=("libnl=$pkgver" lib{nl-3,nl-cli-3,nl-genl-3,nl-idiag-3,nl-nf-3,nl-route-3,nl-xfrm-3}.so)
conflicts=('libnl')
backup=('etc/libnl/classid' 'etc/libnl/pktloc')
options=('staticlibs')
source=("git+https://github.com/thom311/libnl.git")
sha256sums=('SKIP')


pkgver() {
  cd "libnl"

  _tag=$(git tag -l --sort -v:refname | grep -E '^libnl[0-9_]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^libnl//;s/_/./g'
}

build() {
  cd "libnl"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --sysconfdir="/etc"
  make
}

check() {
  cd "libnl"

  #make check
}

package() {
  cd "libnl"

  make DESTDIR="$pkgdir" install
}
