# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Jan-Erik Rediger <badboy at archlinux dot us>

pkgname=kcov-git
pkgver=38.r61.g48a3007
pkgrel=1
pkgdesc="Code coverage tester for compiled programs, Python scripts and shell scripts"
arch=('x86_64')
url="https://github.com/simonkagstrom/kcov"
license=('GPL')
depends=('libelf' 'curl')
makedepends=('cmake' 'elfutils' 'python' 'git')
source=("$pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
  git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cmake \
    -B build \
    -S "$pkgname" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -Wno-dev
  make -C build
}

package() {
  make -C build install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
