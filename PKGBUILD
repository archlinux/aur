# Maintainer: lazywalker <lazywalkerz@gmail.com>

_pkgauthor=lazywalker
_pkgname=lazydns
pkgname=${_pkgname}-bin
pkgver=0.2.51
pkgrel=1
pkgdesc="A light and fast DNS server/forwarder implementation in Rust"
arch=('x86_64' 'aarch64' 'arm' 'i686')
license=('GPL-3.0-or-later')
url="https://github.com/${_pkgauthor}/${_pkgname}"
provides=($pkgname)
conflicts=($_pkgname)
backup=('etc/lazydns/config.yaml')
source=(
    'lazydns.service'
    'lazydns-sysusers.conf'
    'lazydns-tmpfiles.conf'
    "lazydns-source-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
source_x86_64=(lazydns_${pkgver}_x86_64.tar.gz::${url}/releases/download/v${pkgver}/lazydns-full-aarch64-unknown-linux-musl.tar.gz)
source_aarch64=(lazydns_${pkgver}_aarch64.tar.gz::${url}/releases/download/v${pkgver}/lazydns-full-x86_64-unknown-linux-musl.tar.gz)
source_i686=(lazydns_${pkgver}_i686.tar.gz::${url}/releases/download/v${pkgver}/lazydns-full-i686-unknown-linux-musl.tar.gz)
source_arm=(lazydns_${pkgver}_arm.tar.gz::${url}/releases/download/v${pkgver}/lazydns-full-arm-unknown-linux-musleabihf.tar.gz)

sha256sums=('c24b54bb3ef3d63cec7b37fa4dc5c22c69ff97e093620c80d8a5868344e2e9a4'
            '93a5bb5952088a0f7012844a8f152b0a098c6002535b99a6d518aa93fea91fd3'
            '60427ca27cf0632e4862d7f74ca9f4b03022800dd063161952ac34ff76b78ec9'
            'a155ce3df1315e958eb219af3303c5e5f43d3a1fb0846777004b1235d1ac7097')
sha256sums_x86_64=('480a0ac7f97f90f56297556f0cec714fcd490f5ab1278a6ad91963627029fded')
sha256sums_aarch64=('e2da841badd9d5208d66fd3ce97f37fe63b75048b58b60fdccdc30de9cea9a8d')
sha256sums_arm=('667a16681ed2b0f5ab563038b619d82d3f7171533f44f1e97d2c5626932020ce')
sha256sums_i686=('f5b9a5953945ebc6a363086811ad5c498a88a7a14d6bb2d1b203a84bba2bbd8d')

package() {
    install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 "$srcdir/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
    install -Dm644 "$srcdir/$_pkgname-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
    install -Dm644 "$srcdir/$_pkgname-tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
    install -Dm644 "$srcdir/$_pkgname-$pkgver/etc/lazydns/config.yaml" "$pkgdir/etc/$_pkgname/config.yaml"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

    for file in "$srcdir/$_pkgname-$pkgver/docs/man/"*; do
        man=`basename $file`
        section=${file##*.}

        install -Dm644 "$file" "$pkgdir/usr/share/man/man$section/$man"
    done
}
