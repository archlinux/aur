# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Bruno Ancona <brunoanconasala@gmail.com>
# Contributor: Famiu Haque <famiuhaque@gmail.com>

_pkgauthor=akiyosi
_pkgname=goneovim
pkgname=${_pkgname}-bin
pkgver=0.6.17
pkgrel=1
pkgdesc='Neovim GUI written in Golang, using a Golang qt backend'

arch=('x86_64' 'arm64')
license=('MIT')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('expat'
         'fontconfig'
         'freetype2'
         'gcc-libs'
         'glibc'
         'gtk3'
         'libglvnd'
         'libspeechd'
         'libtiff5'
         'libx11'
         'libxcb'
         'neovim'
         'nspr'
         'nss'
         'zlib'
         'postgresql-libs'
         'qt5-base'
         'qt5-svg'
         'qt5-declarative')

_archive="${_pkgname}-v${pkgver}-linux-${CARCH}"
source=("${url}/releases/download/v${pkgver}/${_archive}.tar.bz2"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "${_pkgname}.desktop"
        "${_pkgname}.ico")
sha256sums=('223e9d867022a5f94ca5e2a5f96cdefece459ac81fabb388365ce6816f4bd443'
            'b6e83a53cac77a324599a1fc086a694b72f0f5dde1ce371d737132ea9ca81140'
            'a498b902552ec9e3e57df9aca4397a13e1c930798fa43f348d3f40c56dc226b5'
            'bb7dd036f10fe1e9132d2bbbf346e99234425b012fadf177bb212c472ac5fca0'
            '0a36211b6ada93d811575b5ca9b33511e405f61cca791858ea2fe1eb5d29279e')

package() {
    install -Dm0644 -t "${pkgdir}/usr/share/pixmaps/" "${_pkgname}.ico"
    install -Dm0644 -t "${pkgdir}/usr/share/applications/" "${_pkgname}.desktop"

    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd "${_archive}"
    install -Dm0755 -t "${pkgdir}/usr/bin/" "${_pkgname}"
    install -Dm0644 -t "${pkgdir}/usr/share/nvim/runtime/doc/" "runtime/doc/${_pkgname}.txt"
}
