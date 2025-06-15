# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname=redsea
pkgver=1.2.0
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
sha256sums=('eebe3b63b2348b724145916f858bd187462d78ef7e55af1b913bc1474b374a57')

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
