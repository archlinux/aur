# Maintainer: lazywalker <lazywalkerz@gmail.com>

_pkgauthor=lazywalker
_pkgname=lazydns
pkgname=${_pkgname}-bin
pkgver=0.2.63
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
source_x86_64=(lazydns_${pkgver}_x86_64.tar.gz::${url}/releases/download/v${pkgver}/lazydns-full-x86_64-unknown-linux-musl.tar.gz)
source_aarch64=(lazydns_${pkgver}_aarch64.tar.gz::${url}/releases/download/v${pkgver}/lazydns-full-aarch64-unknown-linux-musl.tar.gz)
source_i686=(lazydns_${pkgver}_i686.tar.gz::${url}/releases/download/v${pkgver}/lazydns-full-i686-unknown-linux-musl.tar.gz)
source_arm=(lazydns_${pkgver}_arm.tar.gz::${url}/releases/download/v${pkgver}/lazydns-full-arm-unknown-linux-musleabihf.tar.gz)

sha256sums=('c24b54bb3ef3d63cec7b37fa4dc5c22c69ff97e093620c80d8a5868344e2e9a4'
            '93a5bb5952088a0f7012844a8f152b0a098c6002535b99a6d518aa93fea91fd3'
            '60427ca27cf0632e4862d7f74ca9f4b03022800dd063161952ac34ff76b78ec9'
            'd99e39e2ab2df7492e9e7aa563d720f43e048b7862b934c775d1000df003dba8')
sha256sums_x86_64=('c3214e2a3812435aed16d3cea097e4aaa46dab350e5ab4cec8a42aa3e8ad4524')
sha256sums_aarch64=('3a2b1f36285235d7c8bca77fbce316693cb5e33a085252e4d1078c2b35603f97')
sha256sums_arm=('a91416fa0a3cfd2b572ef10a73bdb21d3c583ce902bab8772993660c6da333e9')
sha256sums_i686=('0b4ab8d02e681e62f1c386a7e51310e9c5ec3e99b1b83bf82bfe1e58d2a5b102')

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
