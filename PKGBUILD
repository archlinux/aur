# Maintainer: Muzammil Shafique <muzu@duck.com>
_pkgname=tsuki
pkgname="${_pkgname}-bin"
pkgver=0.2.4
_tag="v0.2.4"
_upstream_pkgrel=1
pkgrel=1
pkgdesc="Native Linux game launcher for Wine, Proton, and native titles (prebuilt binary)"
arch=('x86_64')
url="https://github.com/muzammilshafique/tsuki"
license=('GPL-3.0-or-later')
depends=(
    'glibc'
    'gcc-libs'
    'libglvnd'
    'zlib'
    'qt6-base'
    'qt6-declarative'
    'qt6-svg'
    'sdl2'
    'hicolor-icon-theme'
    'tar'
)
optdepends=(
    'ttf-jetbrains-mono-nerd: Nerd Font monospace glyphs in diagnostic paths and logs'
    'wine: Windows game compatibility via system Wine'
    'winetricks: Windows runtime component installer'
    'mangohud: In-game FPS and performance overlay'
    'gamemode: CPU governor and system performance optimizations'
    '7zip: 7z archive extraction support'
    'vulkan-icd-loader: Vulkan graphics support for DXVK/VKD3D'
    'lib32-vulkan-icd-loader: 32-bit Vulkan support for 32-bit Windows games'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
options=('!strip' '!debug')
install=tsuki.install
_pkgfile="${_pkgname}-${pkgver}-${_upstream_pkgrel}-x86_64.pkg.tar.zst"
source_x86_64=("${_pkgfile}::https://github.com/muzammilshafique/tsuki/releases/download/${_tag}/${_pkgfile}")
noextract=("${_pkgfile}")
sha256sums_x86_64=('c0aeb5438b983a5cefd33fbe95c340484d745a23022c71b83cd83403ec19bd29')

package() {
    bsdtar -xf "${srcdir}/${_pkgfile}" -C "${pkgdir}" usr/
    if [[ -d "${pkgdir}/usr/share/licenses/${_pkgname}" ]]; then
        mv "${pkgdir}/usr/share/licenses/${_pkgname}" "${pkgdir}/usr/share/licenses/${pkgname}"
    fi
}

