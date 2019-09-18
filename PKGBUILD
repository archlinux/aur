# Maintainer: CodeHz <codehz@outlook.com>
_pkgname=nsroot
pkgname=$_pkgname-git
pkgver=v0.1.3.1.gcda958c
pkgrel=1
pkgdesc='`chroot`, `mount --bind` without privilege'
arch=(x86 x86_64 arm armv6h armv7h aarch64)
url="https://github.com/codehz/nsroot"
license=('GPL3')
makedepends=('cmake>3')
source=("git+https://github.com/codehz/nsroot")
md5sums=(SKIP)

pkgver() {
  cd "$srcdir"/$_pkgname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$_pkgname"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$_pkgname"/build
  make DESTDIR="$pkgdir/" install
}
