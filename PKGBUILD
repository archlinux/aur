# Maintainer: Ramadan Ali (alicavus) <rot13: ezqa@ezqa.ny>
# Contributor: jthvai

pkgname=naps2
pkgver=8.2.0
pkgrel=1
pkgdesc="NAPS2 - Not Another PDF Scanner. Scan documents to PDF and more, as simply as possible."
arch=("aarch64" "x86_64")
url="https://www.naps2.com"
license=("GPL-2.0-or-later")
depends=("sane" "gtk3")
makedepends=("dotnet-sdk>=8.0.0" "dpkg" "ttf-liberation" "noto-fonts" "noto-fonts-cjk")
optdepends=(
    "sane-airscan: airscan support"
)
options=("!strip" "!debug")
source=("$pkgname-$pkgver.tar.gz::https://github.com/cyanfish/$pkgname/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=("3d8a196f7f5cdcfa1fbe40452589b897a4801fa956f7816b3576e093e2c51d465f8ad19634c9a38f5a7f54ae911bac77cfb4e5aae8bd081c04746cbb096c4d54")

build() {
    cd "$pkgname-$pkgver"
    dotnet run --project NAPS2.Tools pkg deb --nosign
}

package() {
    cp -r $pkgname-$pkgver/**/**/deb/usr $pkgdir/usr
}
