# Maintainer: orange-guo
# Packaging Repo: https://github.com/orange-guo/aur-packages/tree/main/packages/claude-code-stable-bin
pkgname=claude-code-stable-bin
pkgver=2.1.123
pkgrel=1
pkgdesc=Claude\ Code\ terminal-based\ AI\ coding\ assistant\ \(stable\ binary\ release\)
arch=(x86_64 )
url=https://github.com/anthropics/claude-code
license=(LicenseRef-claude-code )
depends=(bash glibc )
makedepends=()
checkdepends=()
optdepends=(git:\ allow\ Claude\ Code\ to\ use\ git github-cli:\ interact\ with\ GitHub glab:\ interact\ with\ GitLab ripgrep:\ use\ system\ ripgrep\ if\ bundled\ search\ is\ disabled )
options=(\!strip )
provides=(claude-code claude-code-stable )
conflicts=(claude-code claude-code-bin claude-code-stable claude-code-latest claude-code-latest-bin )
validpgpkeys=()
install=claude-code-stable-bin.install
source=(claude-wrapper LICENSE.md::https://raw.githubusercontent.com/anthropics/claude-code/v2.1.123/LICENSE.md )
sha256sums=('91374907d431d091be80078090fb30dfb6e341b68f6dc73b74a4d9ffbf93a354'
            '728158fd1037143fad6907e8fa34804177e598b7326519503fe83cafdef849e6')
sha256sums_x86_64=('5a78139b679a86a88a0ac5476c706a64c3105bf6a6d435ba10f3aa3fb635bdb2')
source_x86_64=(claude-code-stable-bin-2.1.123-x86_64::https://storage.googleapis.com/claude-code-dist-86c565f3-f756-42ad-8dfa-d59b1c096819/claude-code-releases/2.1.123/linux-x64/claude )

_binary_source_path=claude-code-stable-bin-2.1.123-x86_64
_install_bin_path=/usr/lib/claude-code-stable-bin/claude
_wrapper_source_path=claude-wrapper
_wrapper_install_path=/usr/bin/claude
_wrapper_mode=755
_service_file=''
_service_install_path=''
_doc_files=()
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
