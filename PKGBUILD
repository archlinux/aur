# Maintainer: Kercy <kercyding@users.noreply.github.com>

pkgname=kocr-gui-bin
pkgver=0.5.4
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
sha256sums_x86_64=('6ddf048cefff5a848be4b3142b47d85027085624e0fea9b451f93381a6354211')
sha256sums_aarch64=('9cb5c18794a0c5681ad9d34d488cd9f64765f93ec8577d00b4ada94d55f04312')

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
