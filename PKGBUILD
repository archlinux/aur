# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname=redsea
pkgver=1.3.1
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
sha256sums=('2d1137dba23c1ae2d8af87bda45ab90ee962e55d3b93dc9295d1a53e15a8cfae')

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
