# Maintainer: kd8bny <kd8bny at gmail dot com>

pkgname=trilium-notes
pkgver=0.51.2
pkgrel=1
pkgdesc="Trilium Notes is a hierarchical note taking application with focus on building large personal knowledge bases."
arch=('x86_64')
url="https://github.com/zadam/trilium"
license=('AGPLv3')
#conflicts=('')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated
source=(
  ${url}/releases/download/v${pkgver}/trilium-linux-x64-${pkgver}.tar.xz
)
sha512sums=(
  fa37cc9d624725c9696e2570945fee512242b4f3f90e792350c88924b3359cf2eee64b6b742353137424dd5607cfae43ac6059e4f9c7b73105054a7ed4142dd3
)

_exec_name="trilium"
_desktop_file="trilium-notes.desktop"
_release_name="trilium-linux-x64"
_install_path="/opt/${pkgname}/"

package() {
    # Install sources in /opt
    cd "${srcdir}/${_release_name}"
    mkdir -p "${pkgdir}/${_install_path}"
    cp -r * "${pkgdir}/${_install_path}"

    mkdir -p "${pkgdir}/usr/bin/" && chmod 755 "${pkgdir}/usr/bin/"
    ln -s "${_install_path}${_exec_name}" "${pkgdir}/usr/bin/${pkgname}"

    # Install .desktop
    install -Dm644 "../../${_desktop_file}" "${pkgdir}/usr/share/applications/${_desktop_file}"

    # # Install icons
    # install -Dm644 "..${_desktop_file}" "${pkgdir}/usr/share/applications/${pkgname}"

    # Install License
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
