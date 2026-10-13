# Maintainer: Xuanjun Wen <wenxuanjun@yahoo.com>

pkgname=tuwunel-bin
pkgdesc="Official successor to conduwuit"
url="https://github.com/matrix-construct/tuwunel"
license=("Apache-2.0")
arch=("x86_64" "aarch64")
pkgver=1.9.4
pkgrel=1
provides=("conduwuit" "tuwunel")
conflicts=("conduwuit")
options=(!strip !debug)
backup=("etc/tuwunel/tuwunel.toml")

source=("https://raw.githubusercontent.com/matrix-construct/tuwunel/v${pkgver}/LICENSE"
        "https://raw.githubusercontent.com/matrix-construct/tuwunel/v${pkgver}/tuwunel-example.toml"
        "https://raw.githubusercontent.com/matrix-construct/tuwunel/v${pkgver}/arch/tuwunel.service")
source_x86_64=("$pkgname-$pkgver-x86_64.zst::https://github.com/matrix-construct/tuwunel/releases/download/v${pkgver}/v${pkgver}-release-all-x86_64-v1-linux-gnu-tuwunel.zst")
source_aarch64=("$pkgname-$pkgver-aarch64.zst::https://github.com/matrix-construct/tuwunel/releases/download/v${pkgver}/v${pkgver}-release-all-aarch64-v8-linux-gnu-tuwunel.zst")

b2sums=('05c474bd372cbb4f52a93982812b2ff8d6a38df6168ad673c8c2a7662ae5a23932b666c0997efec85c13b8a622f2ea4817bc7dc1560f9ed48ff914403595cba7'
        '081724dc2657191c1c60515f44ac79b8f001cb94078d3b0d7cac2f854baa4081daabc5940b10fe4080e9ff53c95cd92f397e43d6515485078b4974bfbbbe2f2e'
        'ff3b6d4e10d4351e9c87af857e7173c65cbe2429d3706e74ea595ca5f133fbd2d1bd19b386aafe8f840869cab145b99e75f49784ada72418d9c4974ae4e7a16e')
b2sums_x86_64=('74018c0f301de25165a7513bcad905da30271a4125e3126607ef48c489b73c986926fe4a3c3f1828ea12e3f28668c5745fe069bb5291d787d2ce021dda27ba58')
b2sums_aarch64=('bd030103ad15e51a34b2e727320c4aa1fbc00739d95d973e3de414cec63224400920f15f0d37b7de4e43983cb18be607f24519e45cd4464011e010755ee78f9f')

prepare() {
    zstd -df "${srcdir}/$pkgname-$pkgver-$CARCH.zst" -o "${srcdir}/tuwunel"
}

package() {
    install -Dm755 "${srcdir}/tuwunel" "${pkgdir}/usr/bin/tuwunel"
    install -Dm644 "${srcdir}/tuwunel.service" "${pkgdir}/usr/lib/systemd/system/tuwunel.service"
    install -Dm644 "${srcdir}/tuwunel-example.toml" "${pkgdir}/etc/tuwunel/tuwunel.toml"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
