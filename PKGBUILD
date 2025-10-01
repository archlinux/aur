# Maintainer: Xuanjun Wen <wenxuanjun@yahoo.com>

pkgname=tuwunel-bin
pkgdesc="Official successor to conduwuit"
url="https://github.com/matrix-construct/tuwunel"
license=("Apache-2.0")
arch=("x86_64" "aarch64")
pkgver=1.4.2
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
b2sums_x86_64=('565a7d77f06af0dee8b59f280c68011b4d74185c8055da02443cf031dfdca0a68038205075a09dba2b994c4da7a5bed1d895a3cbcce1ae6954269a7e83188fca')
b2sums_aarch64=('4f4ecc45625f52fad1d0d8fd0cd7a12be785ebde66ad964b6fd81a59357f91d7528e08ac5523aa82ac3d645e2b79eeff1eb6366f5b8c86b8945ebe715be538cb')

prepare() {
    zstd -df "${srcdir}/$pkgname-$pkgver-$CARCH.zst" -o "${srcdir}/tuwunel"
}

package() {
    install -Dm755 "${srcdir}/tuwunel" "${pkgdir}/usr/bin/tuwunel"
    install -Dm644 "${srcdir}/tuwunel.service" "${pkgdir}/usr/lib/systemd/system/tuwunel.service"
    install -Dm644 "${srcdir}/tuwunel-example.toml" "${pkgdir}/etc/tuwunel/tuwunel.toml"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
