# Maintainer: orange-guo
# Packaging Repo: https://github.com/orange-guo/aur-packages/tree/main/packages/cli-proxy-api-bin
pkgname=cli-proxy-api-bin
pkgver=6.9.38
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
sha256sums_x86_64=('0868e037a45df0120d2b62e9b40f30c112c051d8dbd8019c5e89a525b5d18093')
sha256sums_aarch64=('6ae0566dffd369a5c9ffda1e2c35dd0ff0263ae2f4000538a5affe1b7a672b6d')
source_x86_64=(cli-proxy-api-bin-6.9.38-x86_64.tar.gz::https://github.com/router-for-me/CLIProxyAPI/releases/download/v6.9.38/CLIProxyAPI_6.9.38_linux_amd64.tar.gz )
source_aarch64=(cli-proxy-api-bin-6.9.38-aarch64.tar.gz::https://github.com/router-for-me/CLIProxyAPI/releases/download/v6.9.38/CLIProxyAPI_6.9.38_linux_arm64.tar.gz )

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
