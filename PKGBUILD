# Maintainer: Christian Boxdörfer <christian.boxdoerfer@posteo.de>
pkgname=fsearch
_gitname=fsearch
pkgver=0.1.3
pkgrel=1
pkgdesc="A fast graphical file search utility."
arch=('i686' 'x86_64')
url="https://cboxdoerfer.github.io/fsearch"
license=('GPL2')
depends=('gtk3' 'icu' 'pcre')
makedepends=('git' 'meson')
conflicts=('fsearch-git')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/cboxdoerfer/fsearch/archive/$pkgver.tar.gz")
sha256sums=('b29ca3f49f2847f280320e0b346a5e6ec98e76e3523c78dbd8178a8f8f19b5dc')

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
