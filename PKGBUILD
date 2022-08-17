# Maintainer: Christian Boxdörfer <christian.boxdoerfer@posteo.de>
pkgname=fsearch
_gitname=fsearch
pkgver=0.2.1
pkgrel=1
pkgdesc="A fast graphical file search utility."
arch=('i686' 'x86_64')
url="https://cboxdoerfer.github.io/fsearch"
license=('GPL2')
depends=('gtk3' 'icu' 'pcre')
makedepends=('git' 'meson')
conflicts=('fsearch-git')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/cboxdoerfer/fsearch/archive/$pkgver.tar.gz")
sha256sums=('5fb8f8280ea4417d949b055bbd576161a42d360727abea3d7e9c9300c978a650')

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
