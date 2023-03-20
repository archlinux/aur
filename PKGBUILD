# Maintainer: Helle Vaanzinn <glitsj16 at riseup dot net >

pkgname=fdns
pkgver=0.9.68
pkgrel=2
pkgdesc="Firejail DNS-over-HTTPS proxy server"
arch=(x86_64)
url="https://github.com/netblue30/fdns"
license=(GPL2)
backup=(
    etc/fdns/adblocker
    etc/fdns/coinblocker
    etc/fdns/fp-trackers
    etc/fdns/resolver.seccomp
    etc/fdns/servers
    etc/fdns/trackers
)
depends=(
    libseccomp
    openssl
)
optdepends=('apparmor: support for apparmor profiles'
    'bash-completion: bash completion'
    'firejail: seamless integration support'
    'systemd: run fdns as a systemd service')
validpgpkeys=('F951164995F5C4006A73411E2CCB36ADFC5849A7')
source=("https://github.com/netblue30/fdns/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('e4947548fee32c80ba02f8911b78b60be98ce633239dcd72e71856c7a924cf2d'
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
