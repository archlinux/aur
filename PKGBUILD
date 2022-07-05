# Maintainer: Christian Boxdörfer <christian.boxdoerfer@posteo.de>
pkgname=fsearch
_gitname=fsearch
pkgver=0.1.4
pkgrel=1
pkgdesc="A fast graphical file search utility."
arch=('i686' 'x86_64')
url="https://cboxdoerfer.github.io/fsearch"
license=('GPL2')
depends=('gtk3' 'icu' 'pcre')
makedepends=('git' 'meson')
conflicts=('fsearch-git')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/cboxdoerfer/fsearch/archive/$pkgver.tar.gz")
sha256sums=('289c19136f89712100ff8f6ad4e7cbbdfbd2938a7c076c85c45658f5c36fc7fd')

build() {
    arch-meson $pkgname-$pkgver build \
        --buildtype release \
        -Dchannel=AUR-stable
    meson compile -C build
}

check() {
    meson test -C build
}

package() {
    DESTDIR="$pkgdir" meson install -C build
}
