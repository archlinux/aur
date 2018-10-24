# Maintainer: Philip Goto <philip.goto@gmail.com>

_pkgname=remotely
pkgname=$_pkgname-git
pkgver=r8.8b5f629
pkgrel=1
pkgdesc="A GTK3 VNC Client"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/haecker-felix/Remotely"
license=('GPL3')
depends=('gtk3')
makedepends=('meson'
             'vala')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/haecker-felix/Remotely.git")
md5sums=('SKIP')

pkgver() {
    cd Remotely
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    rm -rf build
    arch-meson Remotely build
    ninja -v -C build
}

package() {
    DESTDIR="$pkgdir/" ninja -C build install
}
