# Maintainer: orange-guo
# Packaging Repo: https://github.com/orange-guo/aur-packages/tree/main/packages/vibe-kanban-bin
pkgname=vibe-kanban-bin
pkgver=0.1.44
pkgrel=1
pkgdesc=Vibe\ Kanban\ -\ AI-powered\ Kanban\ board\ \(Binary\)
arch=(x86_64 )
url=https://vibekanban.com
license=(Proprietary )
depends=()
makedepends=(unzip )
checkdepends=()
optdepends=()
options=(\!strip )
provides=(vibe-kanban )
conflicts=(vibe-kanban )
validpgpkeys=()
install=vibe-kanban-bin.install
source=(vibe-kanban.service )
sha256sums=('48b6d94e9693f7098ad7d3786ff08b648ce08ab8fcfe8ff13cff97906a12a33f')
sha256sums_x86_64=('083f15f027a7052916852f40610db34b021f7e7749593623ac3f67a090447a6b')
source_x86_64=(vibe-kanban-bin-0.1.44.zip::https://npm-cdn.vibekanban.com/binaries/v0.1.44-20260424091429/linux-x64/vibe-kanban.zip )

_binary_source_path=vibe-kanban
_install_bin_path=/usr/bin/vibe-kanban
_wrapper_source_path=''
_wrapper_install_path=''
_wrapper_mode=755
_service_file=vibe-kanban.service
_service_install_path=/usr/lib/systemd/user/vibe-kanban.service
_doc_files=()
_license_files=()
_binary_tag=v0.1.44-20260424091429

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
