# Maintainer: Helle Vaanzinn <glitsj16 at riseup dot net >

pkgname=fdns
pkgver=0.9.64
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
source=("https://github.com/netblue30/fdns/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('267c90bb2f72f50d5dfbe727f3f6242e3271c69db7d168018ce4e2d6c23cf6c2'
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
