# Maintainer: Philipp Joram <mail at phijor dot me>

pkgname=pokefinder
pkgver=4.0.1
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
sha256sums=('f938e2b69f6d6eeecd2448f2f29cdaab0cd208de452dcd7d2c59698b63e4d769')

package() {
    install -v -m755 -d "$pkgdir/usr/bin/"
    install -v -m755 "$srcdir/PokeFinder" "$pkgdir/usr/bin/pokefinder"
    # Remove reference to `/home/appveyor` from RUNPATH
    patchelf --set-rpath "/usr/lib" "$pkgdir/usr/bin/pokefinder"
}
