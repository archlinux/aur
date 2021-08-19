# Maintainer: llamasking
pkgname=netproc-git
_pkgname=netproc
pkgver=0.6.2.r0.ga1c6d7c
pkgrel=1
pkgdesc="A tool to monitor network traffic based on processes. GIT version"
arch=("x86_64")
url="https://github.com/berghetti/netproc"
license=("GPL3")
depends=("ncurses" "glibc")
makedepends=("git")
provides=("netproc")
conflicts=("netproc")
source=("$_pkgname::git+https://github.com/berghetti/netproc")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  install -D -m755 "bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -D -m644 "doc/$_pkgname.8" "$pkgdir/usr/share/man/man8"; \
    gzip -9 -f "doc/$_pkgname.8"
}