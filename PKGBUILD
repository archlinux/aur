# Maintainer: Your Name <juxdeveloper@gmail.com>

pkgname=sunsetr-bin
_realname=sunsetr # The actual binary name
pkgver=0.2.1
pkgrel=1          # Start with 1. Increment if you make PKGBUILD changes for the same pkgver later.
pkgdesc="Automatic color temperature controller for hyprsunset (pre-compiled binary)"
arch=('x86_64')
url="https://github.com/psi4j/sunsetr"
license=('MIT')
depends=('hyprland>=0.48.0' 'hyprsunset>=0.2.0')

# Name of the asset on GitHub
_github_asset_filename="${_realname}-v${pkgver}-x86_64-linux.tar.gz"
# Name of the directory extracted from the asset tarball (this is based on the tarball's internal structure)
_extracted_dir_name="${_realname}-v${pkgver}" # This will be "sunsetr-v0.2.0"

# How we name the downloaded file locally (can be same as GitHub's or slightly different for consistency)
_local_tarball_name="${_realname}-${pkgver}-x86_64-linux.tar.gz" # e.g., sunsetr-0.2.0-x86_64-linux.tar.gz

source=("${_local_tarball_name}::${url}/releases/download/v${pkgver}/${_github_asset_filename}")
sha256sums=('b3615670995549cafd5ddd7f4015fa53b86330d6b99fa47f6fd607c91b27f175')

package() {
    # The files are inside: ${srcdir}/${_extracted_dir_name}/
    # For example: ${srcdir}/sunsetr-v0.2.0/sunsetr

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
