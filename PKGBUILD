# Maintainer: Xuanjun Wen <wenxuanjun@yahoo.com>

pkgname=tuwunel-bin
pkgdesc="Official successor to conduwuit"
url="https://github.com/matrix-construct/tuwunel"
license=("Apache-2.0")
arch=("x86_64" "aarch64")
pkgver=1.6.0
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
        '3c227007aaabb194b68fd63abef52262dde5f028fdd12103432e35bcce59c0e93cb9a2be502d792b2fc9227e1e38e10769c2a5ff10dfd433e89f172e66d0dc2b'
        'bda7061fe2f0db2afbcb40dc3fdc37f760904da542161f12ef8a674687c30947c33867d6ebde19e0ba9d56b64bb12b1ff400a88bfe9646158a48c831bf099ff3')
b2sums_x86_64=('61109d62b533b0b02c229778fd7df056225bcfc67507ca7f7900ee1ba2c92aeb226fea12fea96d20f542c2c8f473750fface45a3a1531d204768640e2c6116e1')
b2sums_aarch64=('151998476838c8a0e1f32f41ca7bb5de1f7a599c1174374e2ce4a1626c84f432919f41d8d3de4e0b6b2badd99d31350c806ce2ad1fe39c0a1941d0f0bad9e153')

prepare() {
    zstd -df "${srcdir}/$pkgname-$pkgver-$CARCH.zst" -o "${srcdir}/tuwunel"
}

package() {
    install -Dm755 "${srcdir}/tuwunel" "${pkgdir}/usr/bin/tuwunel"
    install -Dm644 "${srcdir}/tuwunel.service" "${pkgdir}/usr/lib/systemd/system/tuwunel.service"
    install -Dm644 "${srcdir}/tuwunel-example.toml" "${pkgdir}/etc/tuwunel/tuwunel.toml"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
