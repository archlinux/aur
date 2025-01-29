# Maintainer: Ramadan Ali (alicavus) <rot13: ezqa@ezqa.ny>
# Contributor: jthvai

pkgname=naps2
pkgver=7.5.3
pkgrel=2
pkgdesc="NAPS2 - Not Another PDF Scanner. Scan documents to PDF and more, as simply as possible."
arch=("aarch64" "x86_64")
url="https://www.naps2.com"
license=("GPL-2.0-or-later")
depends=("sane" "gtk3")
# Temporary lock dotnet version to 8.0. naps2 supports v9.0 but it is not released yet
#makedepends=("dotnet-sdk>=8.0.0" "dpkg" "ttf-liberation" "noto-fonts" "noto-fonts-cjk")
makedepends=("dotnet-sdk-8.0" "dpkg" "ttf-liberation" "noto-fonts" "noto-fonts-cjk")
optdepends=(
    "sane-airscan: airscan support"
)
options=("!strip" "!debug")
source=("$pkgname-$pkgver.tar.gz::https://github.com/cyanfish/$pkgname/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=("d3c6d50415345fd34a953742852e4f62a8ed8093b9036a0f221a9d3c92dbf05df14156d1067695765e3a50d703340f7e12eddd91b6799a70997213806c4426a1")

build() {
    cd "$pkgname-$pkgver"
    dotnet run --project NAPS2.Tools pkg deb --nosign
}

package() {
    cp -r $pkgname-$pkgver/**/**/deb/usr $pkgdir/usr
}
