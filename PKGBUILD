# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=gpgit
pkgver=1.4.0
pkgrel=1
epoch=1
pkgdesc="A shell script that automates the process of signing Git sources via GPG"
arch=('any')
url="https://github.com/NicoHood/gpgit"
license=('MIT')
depends=('bash' 'gnupg' 'git' 'xz')
checkdepends=('shellcheck')
optdepends=('jq: Github API upload'
            'curl: Github API upload'
            'lzip: Compression option')
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/NicoHood/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz"
        "${pkgname}-${pkgver}.tar.xz.asc::https://github.com/NicoHood/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz.asc")
sha512sums=('52d6a3a4e2091ddb4476f01185c5b51b646314bac1fd00f1f400d8fe431f5d4362b33b46778523ee508df64f62d5c1873cb57da9f7c8c4cb55823d3623d41a9b'
            'SKIP')
# NicoHood <archlinux {cat} nicohood {dog} de>
validpgpkeys=('97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161')

check() {
    make -C "${pkgname}-${pkgver}" test
}

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="${pkgdir}" install
    install -Dm 644 "${pkgname}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
