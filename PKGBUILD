# Maintainer: Helle Vaanzinn <glitsj16 at riseup dot net >

pkgname=fdns
pkgver=0.9.66
pkgrel=1
pkgdesc="Firejail DNS-over-HTTPS proxy server"
arch=(x86_64)
license=(GPL2)
url="https://github.com/netblue30/fdns"
depends=('libseccomp' 'openssl')
optdepends=('apparmor: support for apparmor profiles'
    'bash-completion: bash completion'
    'firejail: seamless integration support'
    'systemd: run fdns as a systemd service')
validpgpkeys=('F951164995F5C4006A73411E2CCB36ADFC5849A7')
source=("https://github.com/netblue30/fdns/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('6e080ef0c4e970cfc3c1367513226d18358aec271020f944ded1b6e2ae2f6d9f'
            'SKIP')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" install

    # license
    install -Dm644 "${pkgdir}/usr/share/doc/${pkgname}/COPYING" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/COPYING"
}
