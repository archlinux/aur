# Maintainer: Attila Fidan <archlinux-buildsystem@print0.net>

pkgname=fuse-archive-git
_gitname=${pkgname%-git}
pkgver=0.1.14.r1.g7008bfd
pkgrel=1

pkgdesc="Serve archives or compressed files as read-only FUSE filesystems"
url="https://github.com/google/fuse-archive"
license=(Apache-2.0)
arch=(x86_64)

depends=(
  glibc
  fuse2
  libarchive
)
makedepends=(git)
checkdepends=(go)

provides=(fuse-archive)
conflicts=(fuse-archive)

source=("git+$url.git#branch=main")
b2sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname"
  make
}

check() {
  cd "$_gitname"
  make -k check
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir/" install
}
