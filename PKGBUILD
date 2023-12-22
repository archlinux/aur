# Maintainer: Padraic Fanning < fanninpm AT miamioh DOT edu >
# Contributor: Jake <aur@ja-ke.tech>
# Contributor: Ian MacKay <immackay0@gmail.com>

_pkgname='github-desktop'
pkgname="${_pkgname}-bin"
pkgver=3.3.6_linux3
pkgrel=1
_pkgver="${pkgver//_/-}"
_gitname="release-${_pkgver}"
pkgdesc="GUI for managing Git and GitHub."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://desktop.github.com"
license=('MIT')
depends=(
    'curl'
    'git'
    'libsecret'
    'libxss'
    'nspr'
    'nss'
    'org.freedesktop.secrets'
    'unzip'
)
optdepends=('hub: CLI interface for GitHub.')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=(${_pkgname}.desktop)
source_x86_64=(https://github.com/shiftkey/desktop/releases/download/${_gitname}/GitHubDesktop-linux-amd64-${_pkgver}.deb)
source_aarch64=(https://github.com/shiftkey/desktop/releases/download/${_gitname}/GitHubDesktop-linux-arm64-${_pkgver}.deb)
source_armv7h=(https://github.com/shiftkey/desktop/releases/download/${_gitname}/GitHubDesktop-linux-armhf-${_pkgver}.deb)
sha256sums=('932e4c456e8c6db03d27172cf0daa37806bf025bb560d8b3d758c0997d1a618c')
sha256sums_x86_64=('f74d0985f1cdefc0ae017a6d3d7d93a13bd3f44fa0fb1457aa6966df827d97a9')
sha256sums_aarch64=('2c1faf2dbfff1c69cadf1b4ace7bae20fb64b492298698e2bfa56482e6f8a584')
sha256sums_armv7h=('10d0220438d04983d8dd01a12d9c44c8616244fb3a31f0152f85a8809c3fea73')
package() {
    tar xf data.tar.xz -C "${pkgdir}"
    install -d "${pkgdir}/opt/${_pkgname}"
    mv "${pkgdir}/usr/lib/github-desktop" "${pkgdir}/opt/"

    rm "${pkgdir}/usr/share/applications/github-desktop.desktop"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    ln -sf "/opt/$_pkgname/$_pkgname" "${pkgdir}/usr/bin/$_pkgname"
}
