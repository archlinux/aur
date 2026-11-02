# Maintainer: vash909 <iu1bot@xzgroup.net>

pkgname=cordiale-bin
pkgver=1.0.5.41499446713
pkgrel=1
# Upstream appends the GitHub Actions run ID to its binary package version.
_upstream_tag=v1.0.5
_asset=Cordiale_Arch_rolling_x86_64.pkg.tar.zst
pkgdesc='Native desktop client for Grappa chat, built with Rust and Slint (official binary)'
arch=('x86_64')
url='https://github.com/Sythos/Cordiale'
license=('MIT')
# The window-system libraries are loaded dynamically by the Slint backend.
depends=('alsa-lib' 'fontconfig' 'glibc' 'hicolor-icon-theme' 'libgcc'
         'libglvnd' 'libx11' 'libxcb' 'libxcursor' 'libxi'
         'libxkbcommon' 'libxkbcommon-x11' 'wayland')
optdepends=('org.freedesktop.secrets: store credentials in a desktop keyring'
            'xdg-desktop-portal: native file dialogs with a suitable desktop backend'
            'xdg-utils: open links in the default browser'
            'grappa-bin: run a local Grappa server')
provides=("cordiale=${pkgver}")
conflicts=('cordiale')
options=('!strip' '!debug')
source=("${pkgname}-${_upstream_tag}-${_asset}::${url}/releases/download/${_upstream_tag}/${_asset}"
        "cordiale-${_upstream_tag}.LICENSE::https://raw.githubusercontent.com/Sythos/Cordiale/${_upstream_tag}/LICENSE"
        'README.md')
noextract=("${pkgname}-${_upstream_tag}-${_asset}")
sha256sums=('c651899864c98e6961b6b307ef3751bc97af552eddf6122f514c238933cf866f'
            'd05b3be1027c3d7b3a14380f5fb8db091efb8ba40d3628d95e2178e0942915c7'
            'f0ad2c89a6ee3cba5f4d12b02b6b1b8a5ea221e5f57730bfaae8bc1d88f46149')

package() {
    # Install reviewed payload paths, excluding upstream package metadata.
    bsdtar --no-same-owner -xf "${srcdir}/${pkgname}-${_upstream_tag}-${_asset}" \
        -C "${pkgdir}" usr
    install -Dm644 "${srcdir}/cordiale-${_upstream_tag}.LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/README.md" \
        "${pkgdir}/usr/share/doc/cordiale/README.md"
}
