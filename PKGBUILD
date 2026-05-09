# Maintainer: orange-guo
# Packaging Repo: https://github.com/orange-guo/aur-packages/tree/main/packages/cli-proxy-api-bin
pkgname=cli-proxy-api-bin
pkgver=7.0.0
pkgrel=1
pkgdesc=Proxy\ server\ providing\ OpenAI/Gemini/Claude\ compatible\ API\ interfaces\ \(Binary\)
arch=(x86_64 aarch64 )
url=https://github.com/router-for-me/CLIProxyAPI
license=(MIT )
depends=()
makedepends=()
checkdepends=()
optdepends=()
options=(\!strip )
provides=(cli-proxy-api )
conflicts=(cli-proxy-api )
validpgpkeys=()
install=cli-proxy-api-bin.install
source=(cli-proxy-api.service )
sha256sums=('e303e0a3dc106f83aac76b1d2a7dfd891bbeccf5b668bbfb559cc69beb53cf2e')
sha256sums_x86_64=('a6eef8318872cedcf1ea3d76ef41e0d53e10292c5eab1b4884f24c890fb15fc9')
sha256sums_aarch64=('3e2258ca451da41541ec0631a25f7bad1cb726bd8b2951e50eedef06195e26db')
source_x86_64=(cli-proxy-api-bin-7.0.0-x86_64.tar.gz::https://github.com/router-for-me/CLIProxyAPI/releases/download/v7.0.0/CLIProxyAPI_7.0.0_linux_amd64.tar.gz )
source_aarch64=(cli-proxy-api-bin-7.0.0-aarch64.tar.gz::https://github.com/router-for-me/CLIProxyAPI/releases/download/v7.0.0/CLIProxyAPI_7.0.0_linux_aarch64.tar.gz )

_binary_source_path=cli-proxy-api
_install_bin_path=/usr/bin/cli-proxy-api
_wrapper_source_path=''
_wrapper_install_path=''
_wrapper_mode=755
_service_file=cli-proxy-api.service
_service_install_path=/usr/lib/systemd/user/cli-proxy-api.service
_doc_files=(config.example.yaml )
_license_files=(LICENSE )


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
