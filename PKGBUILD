# Maintainer: Eric Biggers <ebiggers3 at gmail dot com>

pkgname=fscryptctl-git
pkgver=1.1.0.r0.g7c80c73
pkgrel=1
pkgdesc='Small C tool for Linux filesystem encryption'
arch=('x86_64')
url='https://github.com/google/fscryptctl'
license=('Apache')
makedepends=('git' 'pandoc')
conflicts=('fscryptctl')
provides=('fscryptctl')
source=('git+https://github.com/google/fscryptctl.git')
sha256sums=('SKIP')

pkgver() {
  cd fscryptctl
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd fscryptctl
  make
}

package() {
  cd fscryptctl
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 -t "$pkgdir/usr/share/doc/fscryptctl/" README.md NEWS.md
}
