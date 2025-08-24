# Maintainer: Pol Rivero < aur AT polrivero DOT com >
# Contributor: Padraic Fanning < fanninpm AT miamioh DOT edu >
# Contributor: Jake <aur@ja-ke.tech>
# Contributor: Ian MacKay <immackay0@gmail.com>

_pkgname='github-desktop-plus'
pkgname="${_pkgname}-bin"
pkgver=3.5.3
pkgrel=1
pkgdesc="Fork of GitHub Desktop with extra features and improvements (binary release)."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/pol-rivero/github-desktop-plus"
license=('MIT')
provides=(${_pkgname})
conflicts=(${_pkgname})
depends=(
    'curl'
    'libcurl-gnutls'
    'git'
    'libsecret'
    'libxss'
    'nspr'
    'nss'
    'org.freedesktop.secrets'
    'unzip'
)
optdepends=('hub: CLI interface for GitHub.')
source=(
    "${_pkgname}.desktop"
    'launch-app.sh'
)

_common_download_url="${url}/releases/download/v${pkgver}/GitHubDesktopPlus-v${pkgver}-linux"
source_x86_64=(${_common_download_url}-x86_64.deb)
source_aarch64=(${_common_download_url}-arm64.deb)
source_armv7h=(${_common_download_url}-armhf.deb)

sha256sums=(
    'ef93d32f46b31818ffea85959f5ac67353df2c4da351b273108765b80c7f080d'
    '2fb026db6ac25ade0535ec1fffec415fd1d023fbfd28b452f29523e51921083a'
)
sha256sums_x86_64=('67f5df2b69a55e30d6b00cc1aab8202c4cde55c4f4253a27331950908e4473af')
sha256sums_aarch64=('989e2f6d2413e77e6aa4ae0add31f8fbf10dbb6215a4f4f85f13efd79df2a742')
sha256sums_armv7h=('e4090281cb2a7e74790ae9bebc46192d854931925093dc7e6842ad6561c78b6b')
package() {
    tar --zstd -xf data.tar.zst -C "${pkgdir}"
    install -d "${pkgdir}/opt/${_pkgname}"

    mv "${pkgdir}/usr/lib/github-desktop-plus/"* "${pkgdir}/opt/${_pkgname}/"
    rmdir "${pkgdir}/usr/lib/github-desktop-plus"
    rmdir "${pkgdir}/usr/lib"

    rm "${pkgdir}/usr/share/applications/github-desktop-plus.desktop"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    install -Dm755 "$srcdir/launch-app.sh" "$pkgdir/usr/bin/${_pkgname}"
}
