# Maintainer: Xuanjun Wen <wenxuanjun@yahoo.com>

pkgname=tuwunel-bin
pkgdesc="Official successor to conduwuit"
url="https://github.com/matrix-construct/tuwunel"
license=("Apache-2.0")
arch=("x86_64" "aarch64")
pkgver=2.0.0
_tag=v2.0.0-assets
pkgrel=1
provides=("conduwuit" "tuwunel")
conflicts=("conduwuit")
options=(!strip !debug)
backup=("etc/tuwunel/tuwunel.toml")

source=("https://raw.githubusercontent.com/matrix-construct/tuwunel/${_tag}/LICENSE"
        "https://raw.githubusercontent.com/matrix-construct/tuwunel/${_tag}/tuwunel-example.toml"
        "https://raw.githubusercontent.com/matrix-construct/tuwunel/${_tag}/arch/tuwunel.service")
source_x86_64=("$pkgname-$pkgver-x86_64.zst::https://github.com/matrix-construct/tuwunel/releases/download/${_tag}/${_tag}-release-default-x86_64-v1-linux-gnu-tuwunel.zst")
source_aarch64=("$pkgname-$pkgver-aarch64.zst::https://github.com/matrix-construct/tuwunel/releases/download/${_tag}/${_tag}-release-default-aarch64-v8-linux-gnu-tuwunel.zst")

b2sums=('05c474bd372cbb4f52a93982812b2ff8d6a38df6168ad673c8c2a7662ae5a23932b666c0997efec85c13b8a622f2ea4817bc7dc1560f9ed48ff914403595cba7'
        'b185614fdbea12236ee4582baf02fbd4bad685cd9a03665d15459c51b5f98a1d87e7035ded00b2ff3097ffb9f8c866598cecb0ad3f03c6039fa1f3f09f7e437e'
        'ff3b6d4e10d4351e9c87af857e7173c65cbe2429d3706e74ea595ca5f133fbd2d1bd19b386aafe8f840869cab145b99e75f49784ada72418d9c4974ae4e7a16e')
b2sums_x86_64=('338360e55e887708320215ec891fddabb046f28bd2f5b151aee9e2e9a3c44f06781173658c50114bea556427b53fe1dea3c7a12befb4976b9ef25b20b915dee7')
b2sums_aarch64=('e4a9f6c9df67f5da319eddb7b2af5dd7b6c833a942fd179abe5affbb02864f275491440c9776596e92811b2a5601aa3864ef168a05a192acd28748b6232505a0')

prepare() {
    zstd -df "${srcdir}/$pkgname-$pkgver-$CARCH.zst" -o "${srcdir}/tuwunel"
}

package() {
    install -Dm755 "${srcdir}/tuwunel" "${pkgdir}/usr/bin/tuwunel"
    install -Dm644 "${srcdir}/tuwunel.service" "${pkgdir}/usr/lib/systemd/system/tuwunel.service"
    install -Dm644 "${srcdir}/tuwunel-example.toml" "${pkgdir}/etc/tuwunel/tuwunel.toml"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
