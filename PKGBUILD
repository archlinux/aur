# Maintainer: Toni Lipponen <toni.lipponen@proton.me>
pkgname='desktopper'
pkgver=r8.b4830da
pkgrel=1
pkgdesc="Application to create desktop entry files"
arch=('x86_64')
url="https://github.com/tonilipponen/desktopper"
license=('GPL')
depends=('glibc' 'gtk4' 'libadwaita')
makedepends=('git' 'cmake' 'gcc')
source=('git+https://github.com/tonilipponen/desktopper.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$pkgname"
    cmake -B build
    cmake --build build --parallel
}

package() {
    cd "$pkgname"
    install -Dm755 ./build/desktopper "$pkgdir/usr/bin/desktopper"
    install -Dm755 desktopper.desktop "$pkgdir/usr/share/applications/desktopper.desktop"
}
