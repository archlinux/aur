# Maintainer: Kercy <kercyding@users.noreply.github.com>

pkgname=kocr-gui-bin
pkgver=0.5.8
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
# The release workflow fills these from the release's .sha256 files.
sha256sums_x86_64=('0abb05feb8d29b6d4019dfd8bcafa8017f5563b1ddcdf18eda980a37460c7f2e')
sha256sums_aarch64=('e6310b98c2b523fc6307d3715dac8909047a7cb7ecd656deabb0c6012066e70c')

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
