# Maintainer: lazywalker <lazywalkerz@gmail.com>

_pkgauthor=lazywalker
_pkgname=lazydns
pkgname=${_pkgname}-bin
pkgver=0.2.60
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
            'cb998579da44035f30b3bb8a30b54459ec8d8225f6bc8413442bf988fb0cca9b')
sha256sums_x86_64=('a394f9b732511584c9e1973bbd3d4763088d025a708da3c9efac60ef17bea1a6')
sha256sums_aarch64=('305d90d8b50e509e8e5c72e89173d69eb98c5ebde2f72cd0c922bcc1714c7fa1')
sha256sums_arm=('9e2f5f51de65b4e62fcbf149d2f315982d3c311493bcc7ce5d259c9e3c22481c')
sha256sums_i686=('556fabd81431878203ff503f744ec397f0dba9f656f6fdc51544e9c6a2d50648')

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
