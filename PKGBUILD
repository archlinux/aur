# Maintainer: Patrik Cyvoct <patrik@ptrk.io>

pkgname=fast-resume-bin
pkgver=2.5.0
pkgrel=1
pkgdesc="Fast fuzzy finder for coding agent session history"
arch=('x86_64' 'aarch64')
url="https://github.com/angristan/fast-resume"
license=('MIT')
depends=('glibc' 'gcc-libs')
optdepends=('libxcb: clipboard support on X11'
            'wl-clipboard: clipboard support on Wayland')
provides=('fast-resume')
conflicts=('fast-resume')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/angristan/fast-resume/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/fast-resume-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/fast-resume-${pkgver}-linux-arm64.tar.gz")
sha256sums=('a76330d5de8374ae5aebe49c04c3e4b9fe2512623e7b60ab79b540fbd6988e4c')
sha256sums_x86_64=('67cc719c60d43f3247dd4c13f73ecde33a2fa1bb9add4848220aba3c801a526e')
sha256sums_aarch64=('181e46898cd598ba02c0c4625dea0079032f23fa51fecb7fa22629114a5391ee')

package() {
    # Upstream ships the binary as `fr` with a `fast-resume` symlink alias.
    install -Dm755 "${srcdir}/fr/fr" "${pkgdir}/usr/bin/fr"
    ln -s fr "${pkgdir}/usr/bin/fast-resume"

    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
