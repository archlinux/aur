# Maintainer: MilakyS <your@email>

pkgname=mks-git
_pkgname=MKS-interpreter
pkgver=0.r38.g9773477
pkgrel=1
pkgdesc="Small experimental scripting language and interpreter written in C"
arch=('x86_64')
url="https://github.com/MilakyS/MKS-interpreter"
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'cmake')
provides=('mks')
conflicts=('mks')
source=("git+https://github.com/MilakyS/MKS-interpreter.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "0.r%s.g%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cmake -S "$srcdir/$_pkgname" \
        -B "$srcdir/build" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build "$srcdir/build"
}

package() {
  install -Dm755 "$srcdir/build/mks_run" "$pkgdir/usr/bin/mks"
  install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$_pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
