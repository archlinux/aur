# Maintainer: hexchain

_pkgname=passt
pkgname=passt-git
pkgdesc='Plug A Simple Socket Transport'
pkgver=r895.310bdbd
pkgrel=1
arch=('x86_64')
url='https://passt.top/passt/about/'
license=('AGPL3' 'custom:BSD-3-Clause')
source=('git+https://passt.top/passt')
sha256sums=('SKIP')
depends=('glibc')
makedepends=('git')
provides=('passt')
conflicts=('passt')

pkgver() {
    cd "$_pkgname"
    (
        set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$_pkgname"
    make
}

package() {
    cd "$_pkgname"
    make install DESTDIR="$pkgdir" prefix=/usr
    install -Dm644 LICENSES/* -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
