# Maintainer: Cipher.J <116757358+psi4j@users.noreply.github.com>

pkgname=sunsetr-bin
_realname=sunsetr
pkgver=0.6.6
pkgrel=1
pkgdesc="Automatic blue light filter for Hyprland, Niri, and everything Wayland (pre-compiled binary)"
arch=('x86_64')
url="https://github.com/psi4j/sunsetr"
license=('MIT')
# Dependencies are optional now
# depends=('hyprland>=0.49.0' 'hyprsunset>=0.2.0')

# Name of the asset on GitHub
_github_asset_filename="${_realname}-v${pkgver}-x86_64-linux.tar.gz"
# Name of the directory extracted from the asset tarball (this is based on the tarball's internal structure)
_extracted_dir_name="${_realname}-v${pkgver}"

# How we name the downloaded file locally (can be same as GitHub's or slightly different for consistency)
_local_tarball_name="${_realname}-${pkgver}-x86_64-linux.tar.gz"

source=("${_local_tarball_name}::${url}/releases/download/v${pkgver}/${_github_asset_filename}")
sha256sums=('c80bca4df16b8ebf799ce9a5a3cab61adaafb42a17b7bf5c2b54b79134479990')

package() {
    # The files are inside: ${srcdir}/${_extracted_dir_name}/

    # Install the binary
    install -Dm755 "${srcdir}/${_extracted_dir_name}/${_realname}" \
                    "${pkgdir}/usr/bin/${_realname}"

    # Install the license file
    install -Dm644 "${srcdir}/${_extracted_dir_name}/LICENSE" \
                    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install the systemd user service file
    install -Dm644 "${srcdir}/${_extracted_dir_name}/${_realname}.service" \
                    "${pkgdir}/usr/lib/systemd/user/${_realname}.service"

    # Install README
    install -Dm644 "${srcdir}/${_extracted_dir_name}/README.md" \
                    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=4 sw=4 et:
