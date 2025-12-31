# Maintainer: lazywalker <lazywalkerz@gmail.com>

_pkgauthor=lazywalker
_pkgname=lazydns
pkgname=${_pkgname}-bin
pkgver=0.2.52
pkgrel=1
pkgdesc="A light and fast DNS server/forwarder implementation in Rust"
arch=('x86_64' 'aarch64' 'arm' 'i686')
license=('GPL-3.0-or-later')
url="https://github.com/${_pkgauthor}/${_pkgname}"
provides=($pkgname)
conflicts=($_pkgname)
backup=('/etc/lazydns/config.yaml')
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
            'ece56a6d6112da221c543e2044a8df85653819769e23b75975813f8c2dd26a1a')
sha256sums_x86_64=('a6551a6166f64259793dd9a8e5fe28adc61c29f56efc4cc0b363e89c960ae847')
sha256sums_aarch64=('084f31aa0caa91bdbb9ad6e2375ed201cbd7057f4a544faba5c1f3fd4e54acb4')
sha256sums_arm=('7373c67cff1a272b05e187cbd96a3eb2c9f9970eb16f824fd5ed3585eeb5900f')
sha256sums_i686=('3d2ac5c084521fcc92c05507081376c0bf0aa2b69456b6fba62bdb5d78d41fdd')
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
