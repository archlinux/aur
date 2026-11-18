# Maintainer: Kercy <kercyding@users.noreply.github.com>

pkgname=kocr-gui-bin
pkgver=0.5.11
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
    "kocr_${pkgver}-1_amd64.deb::${url}/releases/download/v${pkgver}/kocr_${pkgver}-1_amd64.deb"
)
source_aarch64=(
    "kocr_${pkgver}-1_arm64.deb::${url}/releases/download/v${pkgver}/kocr_${pkgver}-1_arm64.deb"
)
# The AUR workflow computes these after verifying the release signatures.
sha256sums_x86_64=('414db38cc58829d086bc20dbb0e830dd7ad404ea879163907795d25dcdda0144')
sha256sums_aarch64=('fa4c2f75148d85739b75457de7f2ee66abd36693c9fa33500a8e526cda5cf777')

package() {
    local deb
    case "$CARCH" in
        x86_64) deb="kocr_${pkgver}-1_amd64.deb" ;;
        aarch64) deb="kocr_${pkgver}-1_arm64.deb" ;;
        *) error "Unsupported architecture: $CARCH"; exit 1 ;;
    esac

    bsdtar -xf "$srcdir/$deb" -C "$srcdir" data.tar.gz
    bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}
