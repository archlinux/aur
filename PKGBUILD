# Maintainer: Víctor Hugo Sosa Esquivel <arch@victorsosa.com>
pkgname=vsfetch-git
pkgver=r1
pkgrel=1
pkgdesc="Graphical GTK3 system info panel for Linux — themes, animations, multi-distro"
arch=('any')
url="https://github.com/victorsosaMx/vsFetch"
license=('MIT')
depends=(
    'python'
    'python-gobject'
    'python-cairo'
    'gtk3'
    'papirus-icon-theme'
    'ttf-jetbrains-mono-nerd'
)
makedepends=('git')
provides=('vsfetch')
conflicts=('vsfetch')
source=("${pkgname}::git+https://github.com/victorsosaMx/vsFetch.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    install -Dm755 vsfetch                    "${pkgdir}/usr/bin/vsfetch"
    install -Dm644 LICENSE                    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md                  "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 config.json                "${pkgdir}/usr/share/doc/${pkgname}/config.json.example"
    for f in themes/*.json; do
        install -Dm644 "$f"                   "${pkgdir}/usr/share/doc/${pkgname}/${f}"
    done
}
