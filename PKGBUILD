# Maintainer: orange-guo
# Packaging Repo: https://github.com/orange-guo/aur-packages/tree/main/packages/cli-proxy-api-bin
pkgname=cli-proxy-api-bin
pkgver=6.9.40
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
sha256sums_x86_64=('66e1b066e97c6daf213f9d13c5d0ae3e913c44ce90c5eaa8e46636c670fba86a')
sha256sums_aarch64=('3540af9e41b78cb06737862b814c51f3a09247bb5d092e1bd1d487345bab46f6')
source_x86_64=(cli-proxy-api-bin-6.9.40-x86_64.tar.gz::https://github.com/router-for-me/CLIProxyAPI/releases/download/v6.9.40/CLIProxyAPI_6.9.40_linux_amd64.tar.gz )
source_aarch64=(cli-proxy-api-bin-6.9.40-aarch64.tar.gz::https://github.com/router-for-me/CLIProxyAPI/releases/download/v6.9.40/CLIProxyAPI_6.9.40_linux_arm64.tar.gz )

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
