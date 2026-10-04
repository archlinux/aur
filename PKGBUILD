# Maintainer: Ramadan Ali (alicavus) <rot13: ezqa@ezqa.ny>
# Contributor: jthvai

pkgname=naps2
pkgver=8.4.1
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
b2sums=("e6f40234b92e8cab39156167bcc65851faaa84bed63079a9c8c7266f07b16a1c0f8aef4768cc68ff9719838bba05cb743dec14170cd87162a821e4ce3751bf3c")

build() {
    cd "$pkgname-$pkgver"
    dotnet run --project NAPS2.Tools pkg deb --nosign
}

package() {
    cp -r $pkgname-$pkgver/**/**/deb/usr $pkgdir/usr
    # Dirty fix, missing debugging library: .NET DAC core library
    cp /usr/share/dotnet/shared/**/10.*/libmscordaccore.so $pkgdir/usr/lib/$pkgname
}
