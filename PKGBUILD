# Maintainers: SteamClientHomebrew <https://github.com/SteamClientHomebrew>

pkgbase="millennium"
pkgname=('millennium' 'millennium-debug')
pkgver=3.0.0_beta.14
pkgrel=1
arch=('x86_64')
url="https://github.com/SteamClientHomebrew/Millennium"
license=('MIT')
makedepends=('bun' 'curl' 'zip' 'unzip' 'tar' 'cmake' 'ninja' 'lib32-gcc-libs' 'lib32-openssl' 'lib32-libidn2' 'lib32-xz' 'lib32-zstd' 'lib32-brotli' 'lib32-libnghttp2' 'lib32-libpsl' 'libx11' 'libxtst')
source=("git+$url.git#commit=7b76c57a5bce56e33aa718bf0eb66c15049de379")
sha256sums=('SKIP')
options=(debug)

_pkgdir="Millennium"

build() {
    cd "$srcdir/$_pkgdir"

    cmake -GNinja . -DCMAKE_BUILD_TYPE=Release --preset linux-release
    cmake --build build
}

package_millennium() {
    pkgdesc="Open-source modding framework for creating and managing Steam Client themes and plugins"
    depends=('steam')
    install=millennium.install

    cd "$srcdir/$_pkgdir"

    install -d "$pkgdir/usr/lib/millennium"
    install -m755 build/libmillennium_x86.so             "$pkgdir/usr/lib/millennium/"
    install -m755 build/libmillennium_hhx64.so           "$pkgdir/usr/lib/millennium/"
    install -m755 build/libmillennium_bootstrap_x86.so   "$pkgdir/usr/lib/millennium/"
    install -m755 build/libmillennium_luavm_x86          "$pkgdir/usr/lib/millennium/"
    install -m755 build/libmillennium_bootstrap_hhx64.so "$pkgdir/usr/lib/millennium/"
    install -Dm644 LICENSE.md                            "$pkgdir/usr/share/licenses/millennium/LICENSE.md"
}

package_millennium-debug() {
    pkgdesc="Debug symbols for Millennium"
    depends=('millennium')
}
