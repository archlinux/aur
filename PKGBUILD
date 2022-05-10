# Maintainer: René Wagner <rwa at clttr dot info>
# Contributor: Juan Simón <play4pro at protonmail dot com>
# Contributor: alium
# Contributor: angelsl
# Contributer: hayao <hayao@fascode.net>

_pkgbase=r8168
pkgname=${_pkgbase}-dkms
pkgver=8.050.00
pkgrel=1
pkgdesc="A kernel module for Realtek 8168 network cards (DKMS version)"
url="https://github.com/mtorromeo/r8168"
license=("GPL")
arch=('i686' 'x86_64')
depends=('glibc' 'dkms')
makedepends=('git')
conflicts=("${pkgname}")
source=("r8168-dkms::git+https://github.com/mtorromeo/r8168.git"
        "dkms.conf")
sha256sums=('SKIP'
            'e33abcbc8fbe3129459ebc60be3b2f8ed55ddc53755f4956d6feb16c61c43250')
install=r8168-dkms.install

package() {
    install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

    sed -e "s/@PKGNAME@/${_pkgbase}/g" \
        -e "s/@PKGVER@/${pkgver}/g" \
        -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

    cd "${pkgname}"
    cp -dr --no-preserve='ownership' src "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/src"
}
