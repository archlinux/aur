# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=anydesk-bin
pkgver=8.1.0
pkgrel=1
pkgdesc="The Fast Remote Desktop Application"
arch=('x86_64' 'aarch64')
url="https://anydesk.com"
license=('custom')
depends=('fakeroot' 'minizip' 'libglvnd' 'gtk3' 'libx11' 'glibc' 'glib2' 'gdk-pixbuf2' 'libxcb' 'cairo' 'pango' 'libxi' 'libxrender' 'libxrandr' 'libxtst' 'libxext' 'libxfixes' 'libxdamage' 'libxkbfile' 'gcc-libs' 'lsb-release' 'polkit')
optdepends=('libpulse: audio support' 'gnome-themes-extra: adwaita theme')
conflicts=('anydesk')
provides=('anydesk')
options=('!strip')
source_x86_64=("https://download.anydesk.com/linux/anydesk-${pkgver}-amd64.tar.gz")
source_aarch64=("https://download.anydesk.com/rpi/anydesk-${pkgver}-arm64.tar.gz")
sha256sums_x86_64=('22615f1ac8aa4f9ab2fa7344e38358bc6229e7e0b973b7b7fba04848336010db')
sha256sums_aarch64=('900000b49f97e66643fc98f688be2b09c8e6744f78a8a4e5a75a0575369a9b6a')

package() {
    # install binary
    install -Dm 755 "${srcdir}/anydesk-${pkgver}/anydesk" "${pkgdir}/usr/bin/anydesk"

    # install desktop entry
    install -Dm 644 "${srcdir}/anydesk-${pkgver}/anydesk.desktop" "${pkgdir}/usr/share/applications/anydesk.desktop"

    # install polkit action
    install -Dm 644 "${srcdir}/anydesk-${pkgver}/polkit-1/com.anydesk.anydesk.policy" "${pkgdir}/usr/share/polkit-1/actions/com.anydesk.anydesk.policy"
    # install icon
    install -Dm 644 "${srcdir}/anydesk-${pkgver}/icons/hicolor/scalable/apps/anydesk.svg" "${pkgdir}/usr/share/pixmaps/anydesk.svg"
    # install license
    install -Dm 644 "${srcdir}/anydesk-${pkgver}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    printf "%b" "\e[1;33m==> WARNING: \e[0mAnyDesk has a systemd service for unattended access. Enable it with: systemctl enable --now anydesk\n"
    # install systemd service
    install -Dm 644 "${srcdir}/anydesk-${pkgver}/systemd/anydesk.service" "${pkgdir}/usr/lib/systemd/system/anydesk.service"
}
