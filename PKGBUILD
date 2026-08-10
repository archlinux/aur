# Maintainer: lazywalker <lazywalkerz@gmail.com>

_pkgauthor=lazywalker
_pkgname=lazydns
pkgname=${_pkgname}-bin
pkgver=0.3.20
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
            '72be467a064e89ea97c50f61bd720b65b3b870ca3608d71c85841f5a825a614b')
sha256sums_x86_64=('900fff65c4d095e972bb8d83a3e2b86cc9ecd6920ebbdcbfd62637c0a82f4635')
sha256sums_aarch64=('c0c8b7070c3c941e116e0f6c64423c200e432917676eff3ba1091a0282c4dfd3')
sha256sums_arm=('6609ef94113b006cac89502720ef415344cfffba6d756c3fbce334a3a49643f1')
sha256sums_i686=('424851c625fe4fada6252296b005b1a5e610cb17a318997b4a3fe9ffc5da4304')

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
