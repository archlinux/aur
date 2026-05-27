# Maintainer: Xuanjun Wen <wenxuanjun@yahoo.com>

pkgname=tuwunel-bin
pkgdesc="Official successor to conduwuit"
url="https://github.com/matrix-construct/tuwunel"
license=("Apache-2.0")
arch=("x86_64" "aarch64")
pkgver=1.7.0
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
        '5ba4ca1fd13e674ee511b9f8e6cc99ae7a6d886d055cdef8f8e7692c6901d12ccac2eb873f50de07870d45ade7c566dd5d44975101a2f3f40c0533a21a453e32'
        'ebcd34c6120059c42d45db5caba667f0e4826817a135d8e672bf9f7b6f11481b3bf5d414ce8dd90bc310e9a8f85a9ef0054289bdbd8a904c15a3c90c8937a8c6')
b2sums_x86_64=('2f4266e7cb77087feb7e90308f24db81e8d8d8d49e5621d9bd0af32473614b05133556a48391688f754473fa2cdc40633338e7b165a407f562bba746ea3f0876')
b2sums_aarch64=('61ff11601f8d2a3592e820f3e7b90e51cf753e154e002ab4a2c83aee6f1f3e0cf88cb05ad402d4a6ce0a5ab052927d001bb57ef81c40b8d02381211e738020fa')

prepare() {
    zstd -df "${srcdir}/$pkgname-$pkgver-$CARCH.zst" -o "${srcdir}/tuwunel"
}

package() {
    install -Dm755 "${srcdir}/tuwunel" "${pkgdir}/usr/bin/tuwunel"
    install -Dm644 "${srcdir}/tuwunel.service" "${pkgdir}/usr/lib/systemd/system/tuwunel.service"
    install -Dm644 "${srcdir}/tuwunel-example.toml" "${pkgdir}/etc/tuwunel/tuwunel.toml"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
