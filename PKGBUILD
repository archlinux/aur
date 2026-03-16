# Maintainer: Goldbro233 bowensun_06@outlook.com
_pkgname=aio-coding-hub
pkgname=${_pkgname}-bin
pkgver=0.32.4
pkgrel=1
pkgdesc="一个All In One的本地AI工具, 支持Win/Mac/Linux"
arch=('x86_64')
url="https://github.com/dyndynjyxa/aio-coding-hub"
options=('!strip' '!debug')
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

depends=(
    'glibc'
    'libgcc'
    'glib2'
    'libsoup3'
    'cairo'
    'webkit2gtk-4.1'
    'gtk3'
    'gdk-pixbuf2'
    'hicolor-icon-theme'
)

source=(
    "${_pkgname}-${pkgver}-linux-amd64.deb::${url}/releases/download/${_pkgname}-v${pkgver}/${_pkgname}-linux-amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/dyndynjyxa/aio-coding-hub/main/LICENSE"
)

noextract=(
    "${_pkgname}-${pkgver}-linux-amd64.deb"
)

sha256sums=('7bdb8057075cd2047b6615bdfa5b444777feacca3893c07b8c2c424ebb7c58c7'
            '90da602b3e6d5f01c42a2bf635376f3d874abc524d10651f27cb278d9a04aa73')

package() {
    local _debdir="${srcdir}/deb"

    rm -rf "${_debdir}"
    install -d "${_debdir}"
    bsdtar -xf "${srcdir}/${_pkgname}-${pkgver}-linux-amd64.deb" -C "${_debdir}"
    bsdtar -xf "${_debdir}"/data.tar.* -C "${pkgdir}"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    rm -rf "${pkgdir}/usr/share/lintian"
    rm -rf "${pkgdir}/DEBIAN"
    rm -rf "${pkgdir}/usr/share/doc/${_pkgname}"
}
