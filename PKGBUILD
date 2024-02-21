# Maintainer: Noa Aarts <itepastra@gmail.com>
pkgname=automapaper-git
pkgver=r.
pkgrel=1
pkgdesc="based GLSL wallpaper that can run automatons using shaders for WLRoots compositors"
arch=('x86_64')
url="https://github.com/itepastra/automapaper"
license=('GPL-3.0-or-later')
groups=()
depends=('wayland' 'libegl' 'glibc')
makedepends=('git' 'meson' 'ninja')
provides=("automapaper")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$name"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    # clean existing sources if any
    rm -rf "$srcdir/automapaper"
    git clone --single-branch $url.git
}

build() {
    cd "$srcdir/automapaper"
    meson setup build --prefix=/usr
    ninja -C build
}

package() {
    cd "$srcdir/automapaper"
    DESTDIR="$pkgdir" ninja -C build install
}

