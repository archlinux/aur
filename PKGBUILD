# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=xtruss-git
# Note that the date here might not match the date on the released tarball;
# we have no control over this, no need to report that :)
pkgver=20211024.c25bf48
pkgrel=1
pkgdesc="X11 protocol tracer, akin to strace"
arch=(x86_64)
url="https://www.chiark.greenend.org.uk/~sgtatham/xtruss/"
license=(MIT)
source=('git+https://git.tartarus.org/simon/xtruss.git')
sha256sums=('SKIP')
makedepends=(cmake git)
conflicts=(xtruss)
provides=(xtruss)

pkgver() {
  cd xtruss
  printf '%s.%s' \
    $(git show --no-patch --format=%cs HEAD | tr -d -) \
    $(git rev-parse --short=7 HEAD)
}

build() {
  cmake \
    -S xtruss \
    -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
