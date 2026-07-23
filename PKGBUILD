# Maintainer: Samiul Quoreshi Sourav <sourav at l3v11.eu.org>

pkgname=cisco7crack
_pkgname=${pkgname}-debian
pkgver=0.0_git20121221.f1c21dd
pkgrel=4
pkgdesc="Crypt and decrypt the cisco type 7 passwords"
arch=('x86_64')
url="https://github.com/madrisan/cisco7crack"
license=('GPL-2.0-or-later')
depends=('glibc')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://salsa.debian.org/pkg-security-team/${pkgname}/-/archive/debian/${pkgver}-${pkgrel}/${_pkgname}-${pkgver}-${pkgrel}.tar.gz")
sha256sums=('c20801a7e98cf7d686e5e1aeb13c15be39100b0c75b5c3caac6b6a1a09c8e69a')

prepare() {
    cd "$srcdir/${_pkgname}-${pkgver}-${pkgrel}"
    while read -r patch; do
        [[ -z "$patch" ]] && continue
        patch -Np1 -i "debian/patches/$patch"
    done < debian/patches/series
}

build() {
    cd "$srcdir/${_pkgname}-${pkgver}-${pkgrel}"
    make
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}-${pkgrel}"
    install -Dm755 cisco7crack "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 debian/cisco7crack.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
