# Maintainer: Jack Reitano <thnikk645@gmail.com>
pkgname=ovolay-bin
_pkgname=ovolay
pkgver=1.0.1
pkgrel=1
pkgdesc="Volume Overlay (Binary Release)"
arch=('x86_64')
url="https://github.com/thnikk/ovolay"
license=('MIT')
depends=(gtk4-layer-shell libpulse)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/ovolay-arch.zip"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/thnikk/ovolay/main/LICENSE")
sha256sums=('1756270e3577373683baaf61d04e17db9c44894826467222d437dcb05af90a4c'
            '8f02b1f2d8cd6f9b0b35d8f808d3a7a02804bc611bc78a5d17d0cd7c6b102e25')

package() {
    # Install the application support files
    install -dm755 "$pkgdir/opt/$_pkgname"
    cp -dr --no-preserve=ownership "$srcdir/_internal" "$pkgdir/opt/$_pkgname/"

    # Install the binary with correct executable permissions
    install -Dm755 "$srcdir/$_pkgname" "$pkgdir/opt/$_pkgname/$_pkgname"

    # Create symlink in /usr/bin
    install -dm755 "$pkgdir/usr/bin"
    ln -sf "/opt/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    # Install the license from the source archive
    install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
