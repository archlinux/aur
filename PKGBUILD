# Maintainer: Padraic Fanning < fanninpm AT miamioh DOT edu >
# Contributor: Jake <aur@ja-ke.tech>
# Contributor: Ian MacKay <immackay0@gmail.com>

_pkgname='github-desktop'
pkgname="${_pkgname}-bin"
pkgver=3.3.3_linux2
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
sha256sums_x86_64=('dd252a4686243f8fea17ff6cf96d23db951658deda258fcbacbcc30fa83d1dbf')
sha256sums_aarch64=('2635ba8006d7b25aad2589632014869c6540b9efeaa7b7cade3cc3d211c031e1')
sha256sums_armv7h=('c4913a8017f2a0b705b2bb0a17a1b88f7c96a9188558524bbdc68525ba161bd8')
package() {
    tar xf data.tar.xz -C "${pkgdir}"
    install -d "${pkgdir}/opt/${_pkgname}"
    mv "${pkgdir}/usr/lib/github-desktop" "${pkgdir}/opt/"

    rm "${pkgdir}/usr/share/applications/github-desktop.desktop"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    ln -sf "/opt/$_pkgname/$_pkgname" "${pkgdir}/usr/bin/$_pkgname"
}
