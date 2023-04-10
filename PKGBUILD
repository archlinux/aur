# Maintainer: Toni Lipponen <toni.lipponen@proton.me>
pkgname='desktopper-git'
_pkgname='desktopper'
pkgver=r9.996145c
pkgrel=1
pkgdesc="Application to create desktop entry files"
arch=('x86_64')
url="https://github.com/tonilipponen/desktopper"
license=('GPL')
depends=('glibc' 'gtk4' 'libadwaita')
makedepends=('git' 'cmake' 'gcc')
source=('git+https://github.com/tonilipponen/desktopper.git')
md5sums=('SKIP')
provides=("desktopper")

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$_pkgname"
    cmake -B build
    cmake --build build --parallel
}

package() {
    cd "$_pkgname"
    install -Dm755 ./build/desktopper "$pkgdir/usr/bin/desktopper"
    install -Dm755 desktopper.desktop "$pkgdir/usr/share/applications/desktopper.desktop"
}
