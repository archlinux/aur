# Maintainer: Kercy <kercyding@users.noreply.github.com>

pkgname=kocr-gui-bin
pkgver=0.5.5
pkgrel=1
pkgdesc='Offline OCR for images (prebuilt GUI)'
arch=('x86_64' 'aarch64')
url='https://github.com/KercyDing/kocr'
license=('MIT')
depends=('glibc' 'gtk4' 'spectacle' 'kdialog' 'libnotify' 'wl-clipboard')
optdepends=(
    'gtk3: fallback when GTK 4 is not installed'
    'xclip: clipboard on X11 without wl-copy'
    'xsel: clipboard on X11 without wl-copy'
)
provides=('kocr-gui')
conflicts=('kocr-qt-bin' 'kocr-gtk-bin')

source_x86_64=(
    "kocr_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/kocr_${pkgver}_amd64.deb"
)
source_aarch64=(
    "kocr_${pkgver}_arm64.deb::${url}/releases/download/v${pkgver}/kocr_${pkgver}_arm64.deb"
)
# The release workflow fills these from the release's .sha256 files.
sha256sums_x86_64=('aac0bfc17722db102af67835408e3647bc51b51c4d8b3d4675e86141cb1a49a7')
sha256sums_aarch64=('3b9ad88f956b71012aced173fe86de209733629d4c73fe734dd8b8bff76bc68e')

package() {
    local deb
    case "$CARCH" in
        x86_64) deb="kocr_${pkgver}_amd64.deb" ;;
        aarch64) deb="kocr_${pkgver}_arm64.deb" ;;
        *) error "Unsupported architecture: $CARCH"; exit 1 ;;
    esac

    bsdtar -xf "$srcdir/$deb" -C "$srcdir" data.tar.gz
    bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}
