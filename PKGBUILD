# Maintainer: Philipp Joram <mail at phijor dot me>

pkgname=pokefinder
pkgver=4.1.0
pkgrel=1
pkgdesc='Cross platform Pokémon RNG tool'
arch=(x86_64)
url='https://github.com/Admiral-Fish/PokeFinder'
license=('GPL3')
depends=(
    'qt6-base'
)
makedepends=(
    'patchelf'
)

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/Admiral-Fish/PokeFinder/releases/download/v$pkgver/PokeFinder-linux.tar.gz"
)
sha256sums=('f6d1bd744684c7196404a21d910d6e02a0151a1352299ae7a4063d51a50b790b')

package() {
    install -v -m755 -d "$pkgdir/usr/bin/"
    install -v -m755 "$srcdir/PokeFinder" "$pkgdir/usr/bin/pokefinder"
    # Remove reference to `/home/appveyor` from RUNPATH
    patchelf --set-rpath "/usr/lib" "$pkgdir/usr/bin/pokefinder"
}
