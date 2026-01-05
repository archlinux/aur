# Maintainer: Piotrek2713 <piotrek.karasinski13@gmail.com>
# Contributor: Kilo Code <ai@kilo.dev>

pkgname=ca-racing-bin
_pkgname=ca-racing
pkgver=0.2.0_alpha
pkgrel=3
pkgdesc="Top-down 2D racing game written in Python (pre-compiled binary)"
arch=('x86_64')
url="https://github.com/piotrek1372/ca-racing"
license=('MIT')
depends=('glibc' 'zlib' 'hicolor-icon-theme')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')

# Transform version for URL (e.g., 0.2.0_alpha -> 0.2.0-alpha) if needed
_urlver="${pkgver/_/-}"

source=("${_pkgname}-${_urlver}-x86_64.tar.gz::https://github.com/piotrek1372/${_pkgname}/releases/download/v${_urlver}/${_pkgname}-${_urlver}-x86_64.tar.gz"
        "icon.png::https://raw.githubusercontent.com/piotrek1372/${_pkgname}/main/assets/images/icon.png"
        "${_pkgname}.desktop")

# Checksums will be updated automatically by 'updpkgsums'
sha256sums=('c42627fc027e92a187412347f0b736912e62a191c6d104747bd8eafe5ddbfd11'
            'a906966a264865e6e8f5567106291f2bbb2b32fac1f9b598b04837b4f969aad9'
            '1daadbed224442b479eb435bb7927a3c16353acbf25eff04d7348202b07cf3f3')

package() {
    # 1. Install main executable to /opt
    install -d "${pkgdir}/opt/${_pkgname}"
    
    # Copy the binary
    install -Dm755 "ca-racing" "${pkgdir}/opt/${_pkgname}/${_pkgname}"
    
    # 2. Create symlink in /usr/bin
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    # 3. Install icon
    install -Dm644 "icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

    # 4. Install desktop file
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
