# Maintainer: czyt <czytcn@gmail.com>
pkgname=veet-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="Universal Linux Application Uninstaller & Deep-Clean Residual Purger"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/swadhinbiswas/veet"
license=('MIT')
options=('!strip' '!debug')
provides=('veet')
conflicts=('veet')
optdepends=(
    'flatpak: clean flatpak applications'
    'snapd: clean snap applications'
    'ttf-jetbrains-mono-nerd: improved terminal rendering'
    'ttf-nerd-fonts-symbols: TUI glyph support'
)
_releases_url="https://github.com/swadhinbiswas/veet"
source=("${pkgname}-LICENSE::${_releases_url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-amd64.tar.gz::${_releases_url}/releases/download/v${pkgver}/veet-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-arm64.tar.gz::${_releases_url}/releases/download/v${pkgver}/veet-v${pkgver}-linux-arm64.tar.gz")
source_armv7h=("${pkgname}-${pkgver}-armv7.tar.gz::${_releases_url}/releases/download/v${pkgver}/veet-v${pkgver}-linux-armv7.tar.gz")
sha256sums=('fb14e2f68989abb28130c42bfd2d2f08663884a5f8b7e42b7685b4d8d32a9ce2')
sha256sums_x86_64=('67499826466c64a3536eb8c39c471420af44657a9d3d4a30594076564c0998e9')
sha256sums_aarch64=('796bc7f0a073b71aaf7ab165bc9e41a886e7d75d031c4980b187e2b80bf1de37')
sha256sums_armv7h=('f17bda87f1d5e5738d2022f1aaf80ce8a107e9eecee5e302c9b1a708b826cc9b')

package() {
    install -Dm644 "${srcdir}/${pkgname}-LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    local _src _bin
    case "$CARCH" in
        x86_64)
            _src="${pkgname}-${pkgver}-amd64.tar.gz"
            _bin="veet-linux-amd64"
            ;;
        aarch64)
            _src="${pkgname}-${pkgver}-arm64.tar.gz"
            _bin="veet-linux-arm64"
            ;;
        armv7h)
            _src="${pkgname}-${pkgver}-armv7.tar.gz"
            _bin="veet-linux-armv7"
            ;;
    esac

    tar -xzf "${srcdir}/${_src}"
    install -Dm755 "${srcdir}/${_bin}" "${pkgdir}/usr/bin/veet"
}
