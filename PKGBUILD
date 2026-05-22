# Maintainer: kingdomkind <kingdomkind@protonmail.com>

_pkgname='userspawn'
pkgname="$_pkgname-git"
pkgrel=1
pkgver=r5.321c8ff
pkgdesc='Launch anything, upon any user login'
arch=('x86_64')
url='https://github.com/Mayware/userspawn'
makedepends=('cmake' 'git' 'ninja')
depends=('dbus')
provides=("$_pkgname")
conflicts=("$_pkgname")
license=('LGPL-3.0-or-later')
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    cmake -B build -S . -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "$_pkgname"
    DESTDIR="$pkgdir" cmake --install build
}
