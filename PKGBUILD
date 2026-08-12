# Maintainer: Simon Späti <simon at ssp dot sh>

# Source AUR package: builds from the GitHub tag tarball with makepkg on the
# user's machine (qt6 makedepends). Bump with `make aur-bump VERSION=vX.Y.Z`,
# then publish with `make aur-publish`.

_pkgauthor=sspaeti
_repo=Omapic                 # GitHub repo name (case-sensitive tarball dir)
pkgname=omapic
pkgver=0.1.1
pkgrel=1
pkgdesc="Horizontal & vertical image cut-outs like Snagit for Linux Wayland with Qt 6."
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_repo}"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'wl-clipboard' 'xdg-desktop-portal')
optdepends=('xdg-desktop-portal-gtk: file open/save dialogs (or -kde / -gnome)')
makedepends=('qt6-base' 'qt6-declarative')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ff56b23472e4f2b90bbaf0fe8b7553efb1e294fcd828c69390b99cbd813ad99c')

build() {
    cd "${_repo}-${pkgver}"
    ./bin/build
}

package() {
    cd "${_repo}-${pkgver}"
    install -Dm755 build/omapic "${pkgdir}/usr/bin/omapic"
    install -Dm644 pkgbuild/omapic.desktop "${pkgdir}/usr/share/applications/omapic.desktop"
    install -Dm644 pkgbuild/omapic.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/omapic.svg"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
