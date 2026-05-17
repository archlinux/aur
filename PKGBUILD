# Maintainer: Aleksandr Silaev <sasasilaev27@gmail.com>
pkgname=libimm-git
_pkgname=libimm
pkgver=1.4.0.r0.g7a2b3c4
pkgrel=1
pkgdesc="Int Memory Manager Library - High-performance allocator with Next-Fit and pool support"
arch=('x86_64')
url="https://intmemory.site"
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'gcc' 'make')
provides=("$_pkgname")
conflicts=("$_pkgname")

source=("git+https://codeberg.org/gnom2949/IntMemoryManager.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || \
  printf "1.4.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  make release
}

package() {
  cd "$srcdir/$_pkgname"
  make install DESTDIR="$pkgdir" PREFIX=/usr
}
