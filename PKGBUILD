# Maintainer: Denton Liu <liu.denton@gmail.com>

pkgname=tetrio-desktop
pkgver=1.0.0
epoch=1
pkgrel=1
pkgdesc='TETR.IO desktop client'
arch=('x86_64')
license=('unknown')
url='https://tetr.io/'
source=("$pkgname-$pkgver.tar.gz::https://tetr.io/about/desktop/builds/TETR.IO%20Setup.tar.gz")
sha256sums=('459818d22bbee4e5bf8b03916cb31d41075904d672b139c407dd841f6771999a')
noextract=("$pkgname-$pkgver.tar.gz")

package() {
    cd "$srcdir"

    mkdir "$pkgdir/opt"
    tar -xzf "$pkgname-$pkgver.tar.gz" -C "$pkgdir/opt"
    mv "$pkgdir/opt/$pkgname-$pkgver" "$pkgdir/opt/$pkgname"

    # fix permissions
    find "$pkgdir/opt/$pkgname" -type f \
        -not \( -name '*.so' -o -name tetrio-desktop \) \
        -exec chmod 644 {} +

    mkdir -p "$pkgdir/usr/bin"
    ln -sf /opt/$pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"
}
