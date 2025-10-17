# Maintainer: Xuanjun Wen <wenxuanjun@yahoo.com>

pkgname=tuwunel-bin
pkgdesc="Official successor to conduwuit"
url="https://github.com/matrix-construct/tuwunel"
license=("Apache-2.0")
arch=("x86_64" "aarch64")
pkgver=1.4.4.0
pkgrel=1
provides=("conduwuit" "tuwunel")
conflicts=("conduwuit")
options=(!lto)
backup=("etc/tuwunel/tuwunel.toml")

source=("https://raw.githubusercontent.com/matrix-construct/tuwunel/v${pkgver}/LICENSE"
        "https://raw.githubusercontent.com/matrix-construct/tuwunel/v${pkgver}/tuwunel-example.toml"
        "https://raw.githubusercontent.com/matrix-construct/tuwunel/v${pkgver}/arch/tuwunel.service")
source_x86_64=("$pkgname-$pkgver-x86_64.zst::https://github.com/matrix-construct/tuwunel/releases/download/v${pkgver}/v${pkgver}-release-all-x86_64-v1-linux-gnu-tuwunel.zst")
source_aarch64=("$pkgname-$pkgver-aarch64.zst::https://github.com/matrix-construct/tuwunel/releases/download/v${pkgver}/v${pkgver}-release-all-aarch64-v8-linux-gnu-tuwunel.zst")

b2sums=('05c474bd372cbb4f52a93982812b2ff8d6a38df6168ad673c8c2a7662ae5a23932b666c0997efec85c13b8a622f2ea4817bc7dc1560f9ed48ff914403595cba7'
        '52506e4826c59d7d48eac4a5997a42c6107bd70c142e28fa380a24fa3c59348ab7eb62304eac533fa8ea197de309076c040278e69e87746ade5a27e56384b4e6'
        '1b8dd649b3201ba63a4e0c9a4b1c9e1eccba665cb49a8bdeb9d93fdf748148a06ef656475cf2fad125e9f7eb466e4ebcd74d508f206464f820643bd4308e7a09')
b2sums_x86_64=('8b8c702e425b414b17ed163146641595ead48f8874838c51dd8d56c98486f3b73ac0668166b75364d7f539b4fb7ea5715a74f8f6dd4eb8593141e6907948f496')
b2sums_aarch64=('700336770f2a08a4f95d5e4e250a0d1b0ea951e8bc4e4b5abae9bfdaf530347a0dcb3b26fa4b748a0469bf9f415d2778d9b98406b52c4e04799c20cf468ae2b4')

prepare() {
    zstd -df "${srcdir}/$pkgname-$pkgver-$CARCH.zst" -o "${srcdir}/tuwunel"
}

package() {
    install -Dm755 "${srcdir}/tuwunel" "${pkgdir}/usr/bin/tuwunel"
    install -Dm644 "${srcdir}/tuwunel.service" "${pkgdir}/usr/lib/systemd/system/tuwunel.service"
    install -Dm644 "${srcdir}/tuwunel-example.toml" "${pkgdir}/etc/tuwunel/tuwunel.toml"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
