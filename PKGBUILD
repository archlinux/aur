# Maintainers: SteamClientHomebrew <https://github.com/SteamClientHomebrew>

pkgver=3.0.0_beta.13
pkgname="millennium"
_pkgdir="Millennium"
pkgrel=1
pkgdesc="Open-source modding framework for creating and managing Steam Client themes and plugins"
arch=('x86_64')
url="https://github.com/SteamClientHomebrew/Millennium"
license=('MIT')
depends=('steam')
makedepends=('bun' 'curl' 'zip' 'unzip' 'tar' 'cmake' 'ninja' 'lib32-gcc-libs' 'lib32-openssl' 'lib32-libidn2' 'lib32-xz' 'lib32-zstd' 'lib32-brotli' 'lib32-libnghttp2' 'lib32-libpsl' 'libx11' 'libxtst')
source=("git+$url.git#commit=c4f721e26186f453f29bb945c99aa68bd71b773b")
sha256sums=('SKIP')
options=(debug)
install=millennium.install

build() {
    cd "$srcdir/$_pkgdir"

    cmake -GNinja . -DCMAKE_BUILD_TYPE=Release --preset linux-release -DDISTRO_ARCH=ON
    cmake --build build
}

package() {
    cd "$srcdir/$_pkgdir"

    install -d "$pkgdir/usr/lib/millennium"
    install -m755 build/libmillennium_x86.so             "$pkgdir/usr/lib/millennium/"
    install -m755 build/libmillennium_hhx64.so           "$pkgdir/usr/lib/millennium/"
    install -m755 build/libmillennium_bootstrap_x86.so   "$pkgdir/usr/lib/millennium/"
    install -m755 build/libmillennium_luavm_x86          "$pkgdir/usr/lib/millennium/"
    install -m755 build/libmillennium_bootstrap_hhx64.so "$pkgdir/usr/lib/millennium/"
    install -Dm644 LICENSE.md                            "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
