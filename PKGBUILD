# Maintainer: Dylan Barker <dthomasbarker@gmail.com>
_pkgname=dmenu
pkgname=$_pkgname-dylan-git
pkgver=5.0.r33.dbb6ae1
pkgrel=1
pkgdesc="Dylan's build of dynamic menu for X"
url="https://github.com/dylantjb/$_pkgname"
arch=('i686' 'x86_64')
license=('MIT')
depends=('sh' 'libxinerama' 'libxft')
optdepends=(
    'libxft-bgra: if dmenu crashes when displaying emojis'
    'libxft-bgra-git: if dmenu crashes when displaying emojis')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    echo "$(awk '/^VERSION =/ {print $3}' config.mk)".r"$(git rev-list --count HEAD)"."$(git rev-parse --short HEAD)"
}

build() {
    cd $_pkgname
    make PREFIX=/usr X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
    cd $_pkgname
    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
