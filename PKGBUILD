# Maintainer: Yukari0201 <130890393+Yukari0201@users.noreply.github.com>

_pkgname=carton
pkgname="${_pkgname}-bin"
pkgver=0.6.2 # renovate: datasource=github-releases depName=821869798/carton
pkgrel=1
pkgdesc="Cross-platform proxy client powered by sing-box"
arch=('x86_64' 'aarch64')
url="https://github.com/821869798/carton"
license=('GPL-3.0-or-later')
depends=(
  'glibc'
  'gcc-libs'
  'libx11'
  'libice'
  'libsm'
  'libxext'
  'libxrandr'
  'libxi'
  'libxcursor'
  'libxfixes'
  'libxkbcommon'
  'libxkbcommon-x11'
  'fontconfig'
  'freetype2'
  'mesa'
  'dbus'
  'zlib'
)
optdepends=(
  'gtk3: file dialogs when no desktop portal is running'
  'xdg-desktop-portal: file dialogs'
  'sudo: TUN and system proxy setup'
)
options=('!strip' '!debug')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=(
    "carton.desktop::${url}/raw/refs/heads/main/packaging/linux/carton.desktop"
    # "carton.desktop::${url}/raw/refs/tags/v${pkgver}/packaging/linux/carton.desktop"
    "carton.png::${url}/raw/refs/tags/v${pkgver}/src/carton.GUI/Assets/carton_icon.png"
    "LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
)
source_x86_64=("${_pkgname}-${pkgver}-linux-x64-package.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64-package.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-linux-arm64-package.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64-package.tar.gz")

sha256sums=('eec9564d657e5945f2d1f73acf0aa4c5d79a2362136cfd81ff881abd6d4e43f5'
            'ddcf47960f17c5652904b24ad99a4a92af03dab850b8f29e50401d2a4a038138'
            'd0f7cd798fd03274d6742245e320bbd2133dfdb7161c4470df4ea862b4fa57dd')
sha256sums_x86_64=('3b8526c79c5dc863afe5bf0410d602e1f04de09ec040bcce4d695d57a91c11ce')
sha256sums_aarch64=('970d5d259f17eb5ef0be7d4e8d2f4c29a3e01c9cd999895e8ad60c952f06451a')

package() {
    local _appdir="${pkgdir}/usr/lib/${_pkgname}"

    install -dm755 "$_appdir"
    cp -p "${srcdir}"/{"${_pkgname}",sing-box,*.so} "${_appdir}/"
    chmod 644 "${_appdir}"/*.so
    printf 'aur\n' > "${_appdir}/.carton_package"

    install -Dm644 "${srcdir}/carton.desktop" "${pkgdir}/usr/share/applications/carton.desktop"
    install -Dm644 "${srcdir}/carton.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/carton.png"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
