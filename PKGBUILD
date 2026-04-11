# Maintainer: orange-guo
# Packaging Repo: https://github.com/orange-guo/aur-packages

pkgname=cli-proxy-api-bin
pkgver=6.9.23
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
sha256sums_x86_64=('bd62a360290a82efdb294a9f99cafc16be632f021ec3eeef95f1e1be3f8a5d49')
sha256sums_aarch64=('11e1b49ec887eeb750944fdddc4018fb1dcb76af8824dccc73206c811a5bde0a')
source_x86_64=(cli-proxy-api-bin-6.9.23-x86_64.tar.gz::https://github.com/router-for-me/CLIProxyAPI/releases/download/v6.9.23/CLIProxyAPI_6.9.23_linux_amd64.tar.gz )
source_aarch64=(cli-proxy-api-bin-6.9.23-aarch64.tar.gz::https://github.com/router-for-me/CLIProxyAPI/releases/download/v6.9.23/CLIProxyAPI_6.9.23_linux_arm64.tar.gz )

_binary_source_path=cli-proxy-api
_install_bin_path=/usr/bin/cli-proxy-api
_service_file=cli-proxy-api.service
_service_install_path=/usr/lib/systemd/user/cli-proxy-api.service
_doc_files=(config.example.yaml )
_license_files=(LICENSE )


package() {
    install -Dm755 "${srcdir}/${_binary_source_path}" "${pkgdir}${_install_bin_path}"

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
