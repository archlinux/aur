# Maintainer: frakod <frakod@pm.me>

pkgname='smooth-scroll-linux-git'
pkgver=r64.5f9e568
pkgrel=1

pkgdesc='A lightweight tool to enhance mouse wheel scrolling, adding inertia and high-resolution precision for buttery-smooth navigation on Linux desktops.'
arch=(x86_64 aarch64)
url='https://github.com/Wayne6530/smooth-scroll-linux'
license=('MIT')

depends=(spdlog libevdev)
makedepends=(cmake)
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver()
{
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
    cd "$srcdir/$pkgname"
    cmake -B build
    cmake --build build --config Release
}

package()
{
    DESTDIR="$pkgdir" cmake --install "$pkgname/build"
}
