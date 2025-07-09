# Maintainer: Xuanjun Wen <wenxuanjun@yahoo.com>

pkgname=tuwunel-bin
pkgdesc="Official successor to conduwuit"
url="https://github.com/matrix-construct/tuwunel"
license=("Apache-2.0")
arch=("x86_64" "aarch64")
pkgver=1.2.0
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
        'e9d40fdab80f3045f9701fb7c4995838043d5efcdca62b2a7279a4cbdab9d586e227b9c5dd718c2c55a9766d535da0607c13fd02c08eab005897c88b92250988'
        '1b8dd649b3201ba63a4e0c9a4b1c9e1eccba665cb49a8bdeb9d93fdf748148a06ef656475cf2fad125e9f7eb466e4ebcd74d508f206464f820643bd4308e7a09')
b2sums_x86_64=('a32c2991d5e875e4c35fb3b44d64112fd6360695046ff6424f13047590edd81ae2c9be4e543a8b0a80185701d2122a8f14725cc9ff97b91be9ed63a2654b65f1')
b2sums_aarch64=('f5a60326f01d5e2948514e812160a07198916d65d77338ea6c467a09191dd04067db1ffd212e4a17d346ad387750737d1e44811fa88ef32da41d0b5d39ca90d8')

prepare() {
    zstd -df "${srcdir}/$pkgname-$pkgver-$CARCH.zst" -o "${srcdir}/tuwunel"
}

package() {
    install -Dm755 "${srcdir}/tuwunel" "${pkgdir}/usr/bin/tuwunel"
    install -Dm644 "${srcdir}/tuwunel.service" "${pkgdir}/usr/lib/systemd/system/tuwunel.service"
    install -Dm644 "${srcdir}/tuwunel-example.toml" "${pkgdir}/etc/tuwunel/tuwunel.toml"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
