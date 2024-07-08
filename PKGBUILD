# Maintainer: Ramadan Ali (alicavus) <rot13: ezqa@ezqa.ny>
# Contributor: jthvai

pkgname=naps2
pkgver=7.4.3
pkgrel=1
pkgdesc="NAPS2 - Not Another PDF Scanner. Scan documents to PDF and more, as simply as possible."
arch=("x86_64")
url="https://www.naps2.com"
license=("GPL-2.0-or-later")
depends=("sane")
makedepends=("dotnet-sdk" "dpkg" "ttf-liberation" "noto-fonts" "noto-fonts-cjk")
optdepends=(
    "sane-airscan: airscan support"
)
options=("!strip" "!debug")
source=("$pkgname-$pkgver.tar.gz::https://github.com/cyanfish/$pkgname/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=("96b52e57b082f52df1094b95360c604be5789dc97ddd4cc46b1f4b59a8692bcea373f34bafb437b00ad1fe0054e53b3e6d204f6193d6d0a73d6b241441a6463a")

build() {
    cd "$pkgname-$pkgver"
    dotnet run --project NAPS2.Tools pkg deb --nosign
}

package() {
    cp -r $pkgname-$pkgver/**/**/deb/usr $pkgdir/usr
}
