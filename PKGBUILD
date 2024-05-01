# Maintainer: Robert Greener <dev@greener.sh>
pkgname=gnome-shell-extension-gsnap
pkgver=19
pkgrel=1
pkgdesc='Move windows into specific regions similar to FancyZones'
arch=('x86_64')
url='https://github.com/GnomeSnapExtensions/gSnap'
license=('GPL-2.0-or-later')
makedepends=('npm')
depends=('gnome-shell')

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/GnomeSnapExtensions/gSnap/archive/refs/tags/releases/$pkgver.tar.gz"
    "gnome-46.patch"
)

prepare() {
    patch "$srcdir/gSnap-releases-$pkgver/src/metadata.json" gnome-46.patch
}

build() {
    cd gSnap-releases-$pkgver
    npm ci
    npm run build
}

package() {
    mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/gSnap@micahosborne"
    cp -r "$srcdir/gSnap-releases-$pkgver/dist/"* "$pkgdir/usr/share/gnome-shell/extensions/gSnap@micahosborne"

}


b2sums=(
    'a080e8e62fcea33c2cc5c50e2e7e9742f5b7b55c98df3ee8dcdbb139d2dd24db73a911ec17734c81b8a69c7d5ff0b57d51b4c2bbabd08b2d772aa39ddfe6129d'
    '4ce02be52f85bd069255261ae454e10d58246d6c17b50fb773e4553ed8c7c959b2888fc5a8f06c3044f78a9ce89cd7d20ce2b68bdf54c37797aae6edc0452248'
)
