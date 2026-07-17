pkgname=stirling-pdf-desktop-bin
pkgver=2.14.2
pkgrel=1
pkgdesc="GitHub's #1 PDF application with 30m downloads. Lightning-fast reading, editing, and 60+ more PDF operations."
arch=('x86_64')
url="https://github.com/Stirling-Tools/Stirling-PDF"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libappindicator-gtk3' 'java-runtime-headless')
provides=('stirling-pdf-desktop')
conflicts=('stirling-pdf-desktop' 'stirling-pdf' 'stirling-pdf-bin')
source=("Stirling-PDF-linux-x86_64-${pkgver}.deb::https://github.com/Stirling-Tools/Stirling-PDF/releases/download/v${pkgver}/Stirling-PDF-linux-x86_64.deb")
sha256sums=('SKIP')

package() {
    cd "$srcdir"
    ar x "Stirling-PDF-linux-x86_64-${pkgver}.deb"
    tar xf data.tar.* -C "$pkgdir"

    # Fix NVIDIA + Wayland Explicit Sync crash
    find "$pkgdir/usr/share/applications" -iname "*.desktop" -exec \
        sed -i 's|^Exec=.*|Exec=env __NV_DISABLE_EXPLICIT_SYNC=1 /usr/bin/Stirling-PDF|' {} \;
}
