# Maintainer: fam007e <faisalmoshiur+gpg@gmail.com>
pkgname=nerdfonts-installer-bin
pkgver=2025.09.27.5
pkgrel=1
pkgdesc="Interactive Nerd Fonts installer written in C"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/fam007e/nerd_fonts_installer"
license=('MIT')
depends=('curl' 'unzip' 'fontconfig')
makedepends=('gcc' 'make' 'jansson')
source=("${url}/releases/download/v${pkgver}/nerdfonts-installer-${pkgver}.tar.gz")
sha256sums=('d1b0d9584689e1b72c53f20b05d19b6b54e5b4686bcbdd1d97fd1d8e0199a025')

build() {
    cd "${srcdir}/nerd_fonts_installer-${pkgver}"
    make
}

package() {
    cd "${srcdir}/nerd_fonts_installer-${pkgver}"
    install -Dm755 "nerdfonts-installer" "${pkgdir}/usr/bin/nerdfonts-installer"

    if [[ -f "LICENSE" ]]; then
        install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi

    if [[ -f "README.md" ]]; then
        install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    fi
}
