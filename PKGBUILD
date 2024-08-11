# Maintainer: Ramadan Ali (alicavus) <rot13: ezqa@ezqa.ny>
# Contributor: jthvai

pkgname=naps2
pkgver=7.5.0
pkgrel=1
pkgdesc="NAPS2 - Not Another PDF Scanner. Scan documents to PDF and more, as simply as possible."
arch=("x86_64")
url="https://www.naps2.com"
license=("GPL-2.0-or-later")
depends=("sane" "gtk3")
makedepends=("dotnet-sdk" "dpkg" "ttf-liberation" "noto-fonts" "noto-fonts-cjk")
optdepends=(
    "sane-airscan: airscan support"
)
options=("!strip" "!debug")
source=("$pkgname-$pkgver.tar.gz::https://github.com/cyanfish/$pkgname/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=("b6cedf0ae55e33d2bcde8e31dfec1948d36f214d6249e4612a161780675665ebbc0e69a697a80837b9f417c4dead4d27efa46e7fc3f7a4df9c0d0bf43c557d4c")

build() {
    cd "$pkgname-$pkgver"
    dotnet run --project NAPS2.Tools pkg deb --nosign
}

package() {
    cp -r $pkgname-$pkgver/**/**/deb/usr $pkgdir/usr
}
