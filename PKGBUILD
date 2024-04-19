# Maintainer: Ramadan Ali (alicavus) <rot13: ezqa@ezqa.ny>

pkgname=naps2
pkgver=7.4.2
pkgrel=1
pkgdesc="NAPS2 - Not Another PDF Scanner. Scan documents to PDF and more, as simply as possible."
arch=("aarch64" "x86_64")
url="https://www.naps2.com"
license=("GPL-2.0-or-later")
depends=("sane")
makedepends=("dotnet-sdk" "dpkg" "ttf-liberation" "noto-fonts" "noto-fonts-cjk")
optdepends=(
    "sane-airscan: airscan support"
)
options=("!strip" "!debug")
source=("$pkgname-$pkgver.tar.gz::https://github.com/cyanfish/$pkgname/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=("80a796085b742dca174ab1dc9c356ed1eb4db641db61faa549514088aa88e9f906c16829c3a6f7f25375e6cb70a125a5ea663e727da0e82c6ff23790749cb538")

build() {
    cd "$pkgname-$pkgver"
    dotnet run --project NAPS2.Tools pkg deb NAPS2.App.Gtk --nosign
}

package() {
    cp -r $pkgname-$pkgver/**/**/deb/usr $pkgdir/usr
}
