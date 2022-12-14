# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=gpgit
epoch=1
pkgver=1.5.0
pkgrel=2
pkgdesc="A shell script that automates the process of signing Git sources via GPG"
arch=('any')
url="https://github.com/NicoHood/gpgit"
license=('MIT')
depends=('bash' 'gnupg' 'git' 'xz')
checkdepends=('shellcheck')
optdepends=('jq: Github API upload'
            'curl: Github API upload'
            'lzip: Compression option'
            'zstd: Compression option')
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/NicoHood/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz"
        "${pkgname}-${pkgver}.tar.xz.asc::https://github.com/NicoHood/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz.asc")
sha512sums=('3c7577d72ce74e5bab1f1ba752539d5977c5746c07d2f71fc61fdab50f9808dcab563070fd1c40f85a119e7edbecc6787a4e250921235e19e6eec0cc0c82a94d'
            'SKIP')
# NicoHood <archlinux {cat} nicohood {dog} de>
validpgpkeys=('97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161')

check() {
    # https://github.com/NicoHood/GPGit/issues/37
    sed -i '/shellcheck/s/-o all//' "${pkgname}-${pkgver}"/Makefile
    make -C "${pkgname}-${pkgver}" test
}

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="${pkgdir}" install
    install -Dm 644 "${pkgname}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
