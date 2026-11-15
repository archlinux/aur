# Maintainer: Kercy <kercyding@users.noreply.github.com>

pkgname=kocr-gui-bin
pkgver=0.5.9
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
sha256sums_x86_64=('efe03fbd759002c083a8ba1949cc829aadc5094ecb62cf98c773103a1d529c39')
sha256sums_aarch64=('ee78a6e3a1915df124c635842d93839887aa50064985953021a5772b10e9690f')

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
