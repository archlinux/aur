# Maintainer: hexchain

_pkgname=passt
pkgname=passt-git
pkgdesc='Plug A Simple Socket Transport'
pkgver=2025_04_15.2340bbf.r11.g587980c
pkgrel=1
arch=('x86_64')
url='https://passt.top/passt/about/'
license=(
    BSD-3-Clause
    GPL-2.0-or-later
)
source=('git+https://passt.top/passt')
sha256sums=('SKIP')
depends=('glibc')
makedepends=('git')
optdepends=(
    'sh: for demo script'
)
provides=('passt')
conflicts=('passt')

pkgver() {
    git -C "$_pkgname" describe --tags --long 2>/dev/null | sed -e 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    make VERSION="$pkgver" FORTIFY_FLAG= -C "$_pkgname"
}

package() {
    make DESTDIR="$pkgdir/" prefix=/usr install -C "$_pkgname"
    install -vDm 644 $_pkgname/LICENSES/* -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
