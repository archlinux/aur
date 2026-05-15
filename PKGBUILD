# Maintainer: orange-guo
# Packaging Repo: https://github.com/orange-guo/aur-packages/tree/main/packages/zellij-no-mouse-resize-bin
pkgname=zellij-no-mouse-resize-bin
pkgver=0.44.3.r1
pkgrel=1
pkgdesc=Zellij\ with\ advanced_mouse_actions\ also\ gating\ pane\ mouse\ resize\ \(binary\)
arch=(x86_64 )
url=https://zellij.dev
license=(MIT )
depends=(glibc libgcc libgcc_s.so zlib libz.so )
makedepends=()
checkdepends=()
optdepends=()
options=(\!strip )
provides=(zellij zellij-no-mouse-resize )
conflicts=(zellij zellij-bin zellij-git zellij-no-mouse-resize )
validpgpkeys=()

source=()
sha256sums_x86_64=('f31aafa8645d96caf29dfebbbd8d54bbcae778de95fb06ebd311a5b7fcca4ee0')
source_x86_64=(zellij-no-mouse-resize-bin-0.44.3.r1-x86_64.tar.gz::https://github.com/orange-guo/aur-packages/releases/download/zellij-no-mouse-resize-bin-v0.44.3.r1/zellij-no-mouse-resize-bin-0.44.3.r1-x86_64-unknown-linux-gnu.tar.gz )

_binary_source_path=zellij
_install_bin_path=/usr/bin/zellij
_wrapper_source_path=''
_wrapper_install_path=''
_wrapper_mode=755
_service_file=''
_service_install_path=''
_doc_files=(README.md )
_license_files=(LICENSE.md )


package() {
    install -Dm755 "${srcdir}/${_binary_source_path}" "${pkgdir}${_install_bin_path}"

    if [ -n "${_wrapper_source_path}" ] && [ -n "${_wrapper_install_path}" ]; then
        install -Dm${_wrapper_mode} "${srcdir}/${_wrapper_source_path}" "${pkgdir}${_wrapper_install_path}"
    fi

    local doc_file
    for doc_file in "${_doc_files[@]}"; do
        [ -f "${srcdir}/${doc_file}" ] || continue
        install -Dm644 "${srcdir}/${doc_file}" "${pkgdir}/usr/share/doc/${pkgname}/$(basename "${doc_file}")"
    done

    local license_file
    for license_file in "${_license_files[@]}"; do
        [ -f "${srcdir}/${license_file}" ] || continue
        install -Dm644 "${srcdir}/${license_file}" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${license_file}")"
    done

    if [ -n "${_service_file}" ] && [ -f "${srcdir}/${_service_file}" ]; then
        install -Dm644 "${srcdir}/${_service_file}" "${pkgdir}${_service_install_path}"
    fi
}
