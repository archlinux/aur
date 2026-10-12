# Maintainer: Ramadan Ali (alicavus) <rot13: ezqa@ezqa.ny>
# Contributor: jthvai

pkgname=naps2
pkgver=8.5.0
pkgrel=1
pkgdesc="NAPS2 - Not Another PDF Scanner. Scan documents to PDF and more, as simply as possible."
arch=("aarch64" "x86_64")
url="https://www.naps2.com"
license=("GPL-2.0-or-later")
depends=("sane" "gtk3")
makedepends=("dotnet-sdk=10.0" "dpkg" "ttf-liberation" "noto-fonts" "noto-fonts-cjk")
optdepends=(
    "sane-airscan: airscan support"
)
options=("!strip" "!debug")
source=("$pkgname-$pkgver.tar.gz::https://github.com/cyanfish/$pkgname/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=("aba614984ce9851b1016709586bfac366a8e223deed37af4de376664cb857ead6979e9518a38e71905be560e0d80e9f07cdff8d2ccccf9337b5bf3cc946c1b6e")

build() {
    cd "$pkgname-$pkgver"
    dotnet run --project NAPS2.Tools pkg deb --nosign
}

package() {
    cp -r $pkgname-$pkgver/**/**/deb/usr $pkgdir/usr
    # Dirty fix, missing debugging library: .NET DAC core library
    cp /usr/share/dotnet/shared/**/10.*/libmscordaccore.so $pkgdir/usr/lib/$pkgname
}
