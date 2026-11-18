pkgname=poptato-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='Keyboard-driven app launcher, command runner, and fuzzy menu for Linux'
arch=('x86_64' 'aarch64')
url='https://github.com/skorotkiewicz/poptato'
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell')
provides=('poptato')
conflicts=('poptato')
options=('!strip' '!debug')
source_x86_64=("${url}/releases/download/v${pkgver}/poptato-${pkgver}-x86_64-linux.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/poptato-${pkgver}-aarch64-linux.tar.gz")
sha256sums_x86_64=('1bc3744ea9860033dfffc6ca7603543948706b69756ae2a11f684ef268d6fbab')
sha256sums_aarch64=('dd00e2814860fc3cacd3fa72410f24d80ec2d527a79dce52a1b0117844e6249e')

package() {
    install -Dm755 poptato "${pkgdir}/usr/bin/poptato"
    install -Dm644 config.toml "${pkgdir}/usr/share/doc/${pkgname}/config.toml"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    local theme
    for theme in themes/*/; do
        install -Dm644 -t "${pkgdir}/usr/share/poptato/$theme" "${theme}config.toml" "${theme}theme.css"
    done
}
