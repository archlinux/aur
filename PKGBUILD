# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname=redsea
pkgver=1.3.0
pkgrel=1
pkgdesc="RDS decoder for the command line "
arch=(x86_64 aarch64)
url="https://github.com/windytan/redsea"
license=(MIT)
depends=('glibc' 'gcc-libs' 'libsndfile' 'liquid-dsp' 'nlohmann-json')
makedepends=('meson' 'catch2')
source=(
    "$pkgname-$pkgver.tar.gz"::https://github.com/windytan/$pkgname/archive/refs/tags/v$pkgver.tar.gz
)
sha256sums=('b322a5253632317d0fbc6ca8b6a6c6b83f781318429f7d31f12e13e44aa05665')

build() {
    cd $pkgname-$pkgver
    meson setup --prefix /usr build
    meson compile -C build
}

package() {
    cd $pkgname-$pkgver
    DESTDIR=$pkgdir meson install -C build

    install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
