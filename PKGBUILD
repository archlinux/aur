# Maintainer: Velamniro <velamniro at proton dot me>

pkgname=hacpack
_pkgname="hacPack"
pkgver=1.36_r2
pkgrel=1
pkgdesc="A tool for creating Nintendo Switch NCAs and packing them into NSPs"
arch=('x86_64')
url="https://github.com/DarkMatterCore/hacPack"
license=('GPL-2.0-only AND ISC AND Apache-2.0')
depends=('glibc')
source=("$_pkgname-${pkgver//_/-}.tar.gz::$url/archive/refs/tags/v${pkgver//_/-}.tar.gz")
b2sums=('723b3e969615bf51b304fddf06623fe266b4cd873569d3a823f4a28c0822c530b03dbf598d3ed91531dc6b8f2bd090706bc3812feac1684616007aad60160b9d')

prepare() {
    cd "$_pkgname-${pkgver//_/-}"
    cp "config.mk.template" "config.mk"

    sed -i 's/^CFLAGS =/CFLAGS +=/' "config.mk"
    sed -i 's/^LDFLAGS =/LDFLAGS +=/' "config.mk"
}

build() {
    cd "$_pkgname-${pkgver//_/-}"
    make
}

package() {
    cd "$_pkgname-${pkgver//_/-}"

    install -Dm0755 hacpack -t "$pkgdir/usr/bin/"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/hacpack.LICENSE" # GPL
    install -Dm644 LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname/" # ISC
    install -Dm644 mbedtls/apache-2.0.txt "$pkgdir/usr/share/licenses/$pkgname/mbedtls.LICENSE" # Apache

    install -Dm644 "docs/$_pkgname/README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
}
