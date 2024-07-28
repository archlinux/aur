# Maintainer: a821
# Contributor: Emil Edholm <emil@edholm.it>

pkgname=honggfuzz-git
pkgver=2.6.r33.gb4f72b42
pkgrel=1
pkgdesc="Security oriented, feedback-driven, evolutionary, easy-to-use fuzzer"
arch=('x86_64')
url="https://honggfuzz.dev"
license=('Apache-2.0')
depends=('binutils' 'libunwind')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/google/honggfuzz.git")
md5sums=('SKIP')

pkgver() {
    git -C "$pkgname" describe --tags --exclude '[a-z]*' | sed -e 's/-/.r/;s/-/./g'
}

build() {
    unset CFLAGS
    make -C "$pkgname"
}

package() {
    make -C "$pkgname" DESTDIR="$pkgdir" PREFIX=/usr install
}

# vim: set ts=4 sw=4 et:
