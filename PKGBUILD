# Maintainer: JakobDev<jakobdev at gmx dot de>

pkgname=bbatools5
pkgver=1.6.0.1
pkgrel=1
pkgdesc="Command line tool to read/write SHoK bba/s5x archives"
arch=("x86_64")
url="https://github.com/mcb5637/bbaToolS5"
license=("MIT")
depends=("dotnet-runtime-8.0")
makedepends=("dotnet-sdk-8.0")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mcb5637/bbaToolS5/archive/refs/tags/v${pkgver}.tar.gz" "wrapper.sh" "fix-path.patch")
sha256sums=("34b47ceeab2c0ea2cbd1b5bc8e7bd23d49d7c7dac871d363977dc814eed4d31f" "76adce4581ce5dd6a720fedfb467b27dee34abac8c110336f75294c20f668627" "8f823aad3a758de4f6330d09591d746e1038c0e8e53947f71db47c21041374fd")

prepare() {
    cd "bbaToolS5-${pkgver}"
    patch -p 1 < ../fix-path.patch
}

build() {
    cd "bbaToolS5-${pkgver}/bbaToolS5"
    dotnet publish -o out
}

package() {
    mkdir -p "${pkgdir}/usr/lib/bbatools5"
    cp -r bbaToolS5-${pkgver}/bbaToolS5/out/* "${pkgdir}/usr/lib/bbatools5"
    install -Dm755 wrapper.sh "${pkgdir}/usr/bin/bbatools5"
    install -Dm644 "bbaToolS5-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 "bbaToolS5-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
