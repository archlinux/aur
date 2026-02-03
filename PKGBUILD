# Maintainer: Xuanjun Wen <wenxuanjun@yahoo.com>

pkgname=tuwunel-bin
pkgdesc="Official successor to conduwuit"
url="https://github.com/matrix-construct/tuwunel"
license=("Apache-2.0")
arch=("x86_64" "aarch64")
pkgver=1.5.0
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
        '144d333f9ad2e0700ef1e7045297df7fa08adb078d0863ab16ef1e2e35a8128b91049aa45eaa952bed842492874125e36f7e8272054f7ad26227203c3e33aa8b'
        'eb4f424b14d282795c55a5943512a87eaeb3496407c2b4f0815a3f819294af773c801e1135d340edb5b2083967b91ff5a9d2226f748f48ec0d1b2b23d676ff3c')
b2sums_x86_64=('cdfcf6b36e0632e1866ce7f620f2d511ec84584dcecd09df0dc06bb25311ecdc81fded64ad27a47a40cc00e2b42563a8a98e48b10e57cac92c86984fd7f172bf')
b2sums_aarch64=('b4dbad27af2a20e92ab0557e629ee1eb68fd620495488bef59ce7076e5ae480280de5eb55c11e9fc1d5417dc42fadb9320ed2c86167e42addde29b1abc1d85a6')

prepare() {
    zstd -df "${srcdir}/$pkgname-$pkgver-$CARCH.zst" -o "${srcdir}/tuwunel"
}

package() {
    install -Dm755 "${srcdir}/tuwunel" "${pkgdir}/usr/bin/tuwunel"
    install -Dm644 "${srcdir}/tuwunel.service" "${pkgdir}/usr/lib/systemd/system/tuwunel.service"
    install -Dm644 "${srcdir}/tuwunel-example.toml" "${pkgdir}/etc/tuwunel/tuwunel.toml"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
