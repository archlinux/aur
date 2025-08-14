# Maintainer: Xuanjun Wen <wenxuanjun@yahoo.com>

pkgname=tuwunel-bin
pkgdesc="Official successor to conduwuit"
url="https://github.com/matrix-construct/tuwunel"
license=("Apache-2.0")
arch=("x86_64" "aarch64")
pkgver=1.3.0
pkgrel=1
provides=("conduwuit" "tuwunel")
conflicts=("conduwuit")
options=(!lto)
backup=("etc/tuwunel/tuwunel.toml")

source=("https://raw.githubusercontent.com/matrix-construct/tuwunel/main/LICENSE"
        "https://raw.githubusercontent.com/matrix-construct/tuwunel/main/tuwunel-example.toml"
        "https://raw.githubusercontent.com/matrix-construct/tuwunel/main/arch/tuwunel.service")
source_x86_64=("$pkgname-$pkgver-x86_64.zst::https://github.com/matrix-construct/tuwunel/releases/download/v${pkgver}/v${pkgver}-release-all-x86_64-v1-linux-gnu-tuwunel.zst")
source_aarch64=("$pkgname-$pkgver-aarch64.zst::https://github.com/matrix-construct/tuwunel/releases/download/v${pkgver}/v${pkgver}-release-all-aarch64-v8-linux-gnu-tuwunel.zst")

b2sums=('05c474bd372cbb4f52a93982812b2ff8d6a38df6168ad673c8c2a7662ae5a23932b666c0997efec85c13b8a622f2ea4817bc7dc1560f9ed48ff914403595cba7'
        '5adb7577cb752ffd1348fb37dbd4c6a32bbc176ee87ef1c0bfe89500bd4100c94c59750938c102cac3bf7ad73660573aa0dce9590ec8bd52da88cda64bc46c00'
        '1b8dd649b3201ba63a4e0c9a4b1c9e1eccba665cb49a8bdeb9d93fdf748148a06ef656475cf2fad125e9f7eb466e4ebcd74d508f206464f820643bd4308e7a09')
b2sums_x86_64=('bf9b3ccade60d4000fdb6f2cd2f5f134f9904861466c8b902f6ce338c3b41790b2166709ad0a979b90fe79e80a1201f5de2c79d62e85ab3036a8bcdb077515c0')
b2sums_aarch64=('a66ced2a3bfaa28bcc32e43597d2d043460ee4d1fd52c7e37051410c2071a2bbab3564dc3128e75e9796676b7d924e2b19037337a3b511785dfd2d8a57542d7d')

prepare() {
    zstd -df "${srcdir}/$pkgname-$pkgver-$CARCH.zst" -o "${srcdir}/tuwunel"
}

package() {
    install -Dm755 "${srcdir}/tuwunel" "${pkgdir}/usr/bin/tuwunel"
    install -Dm644 "${srcdir}/tuwunel.service" "${pkgdir}/usr/lib/systemd/system/tuwunel.service"
    install -Dm644 "${srcdir}/tuwunel-example.toml" "${pkgdir}/etc/tuwunel/tuwunel.toml"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
