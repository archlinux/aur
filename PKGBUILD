# Maintainer: Vinay Kumar <vinayydv343@gmail.com>
pkgname=shiorii-bin
pkgver=1.0.7
pkgrel=1
pkgdesc="Modern offline-first eBook library manager built with Tauri, React, and Rust"
arch=('x86_64')
url="https://github.com/vinayydv3695/Shiori"
license=('MIT')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'libayatana-appindicator'
    'librsvg'
    'sqlite'
    'zstd'
)
optdepends=(
    'speech-dispatcher: Native TTS support (experimental)'
)
provides=(
    'shiorii'
    'shiori'
    'shiori-bin'
    'shiori-rin-bin'
    'shiori-ebook-bin'
)
conflicts=(
    'shiorii'
    'shiorii-git'
    'shiori'
    'shiori-git'
    'shiori-bin'
    'shiori-rin'
    'shiori-rin-bin'
    'shiori-ebook'
    'shiori-ebook-bin'
)
source=("Shiori_${pkgver}_linux_amd64.tar.gz::https://github.com/vinayydv3695/Shiori/releases/download/v${pkgver}/Shiori_${pkgver}_linux_amd64.tar.gz")
sha256sums=('794bbb612c4fc03a7aaec59bd1f213644b76006358fa46dfc4761940cf7d1ea1')

package() {
    bsdtar -xpf "${srcdir}/Shiori_${pkgver}_linux_amd64.tar.gz" -C "${pkgdir}"

    if [[ ! -f "${pkgdir}/usr/bin/shiori" ]]; then
        echo "Missing usr/bin/shiori in release tarball" >&2
        return 1
    fi

    if [[ ! -f "${pkgdir}/usr/share/applications/Shiori.desktop" ]]; then
        echo "Missing usr/share/applications/Shiori.desktop in release tarball" >&2
        return 1
    fi

    chmod -R u=rwX,go=rX "${pkgdir}/usr"
    chmod 755 "${pkgdir}/usr/bin/shiori"
}
