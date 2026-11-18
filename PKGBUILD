# Maintainer: Kercy <kercyding@users.noreply.github.com>

pkgname=kocr-gui-bin
pkgver=0.5.12
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
sha256sums_x86_64=('06d5dbcd5fe5a9e10392112ad50de16801113b3b95f8e741a2651469348ab0c7')
sha256sums_aarch64=('4c8001d367912741a03c594d4d9cf40db2b4a9e8307a2c94e922e389acbce23f')

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
