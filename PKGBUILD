# Maintainer: Xuanjun Wen <wenxuanjun@yahoo.com>

pkgname=tuwunel-bin
pkgdesc="Official successor to conduwuit"
url="https://github.com/matrix-construct/tuwunel"
license=("Apache-2.0")
arch=("x86_64" "aarch64")
pkgver=1.4.1
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
        '4cc19d99157f031ff14dd1285b0e175a522b22176db86ac0ea7e7aa1c8531e784e29621fa3ef3a31cd7f85887af955afcbdbe1a2295ddf02d642950d191e89c1'
        '1b8dd649b3201ba63a4e0c9a4b1c9e1eccba665cb49a8bdeb9d93fdf748148a06ef656475cf2fad125e9f7eb466e4ebcd74d508f206464f820643bd4308e7a09')
b2sums_x86_64=('82ef9274e867dd91728276f53ec6112877683ff065e06b9a306c63f4324ed2da6fabf61bde39b61bb70fe887741f69fc76aa4ead679c7c63c80e568de95e883d')
b2sums_aarch64=('bec3b2dc9e40632d8b59b49edf90f1db9e2cebcb49b6f4f4ac11c1fe19fba15683f593241abafbea02d9d99ba6d527ea8429de538b4eb05d6c81c66880efba50')

prepare() {
    zstd -df "${srcdir}/$pkgname-$pkgver-$CARCH.zst" -o "${srcdir}/tuwunel"
}

package() {
    install -Dm755 "${srcdir}/tuwunel" "${pkgdir}/usr/bin/tuwunel"
    install -Dm644 "${srcdir}/tuwunel.service" "${pkgdir}/usr/lib/systemd/system/tuwunel.service"
    install -Dm644 "${srcdir}/tuwunel-example.toml" "${pkgdir}/etc/tuwunel/tuwunel.toml"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
