# Maintainer: Douglas Soares de Andrade <contato@douglasandrade.com>
pkgname=hyprtasking
pkgver=0.4
pkgrel=1
pkgdesc='Hyprland plugin for workspace overview and management'
arch=('x86_64')
url='https://github.com/douglas/hyprtasking'
license=('BSD-3-Clause')
depends=('hyprland')
makedepends=('meson' 'ninja')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4fa8e3208fddcf5c59dafe6f8ba2bf36f725042444208a4c2074858651ceac7b')

build() {
    cd "$pkgname-$pkgver"
    meson setup build --prefix=/usr --buildtype=release
    meson compile -C build
}

check() {
    cd "$pkgname-$pkgver"
    meson test -C build logic-tests --print-errorlogs
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" meson install -C build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
