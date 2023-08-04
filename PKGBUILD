# Maintainer: MonkeySaint <monekysaint at gmail dot com>
pkgname=anydesk-atera
pkgver=6.0.1
pkgrel=2
pkgdesc="Anydesk for atera, based on anydesk-bin in the aur"
arch=('x86_64')
url="https://atera.com/"
license=('custom')
depends=('fakeroot' 'minizip' 'python-shiboken2' 'gtkglext' 'libglvnd' 'gtk2' 'libx11' 'glibc' 'glib2' 'gdk-pixbuf2' 'libxcb' 'cairo' 'pango' 'libxi' 'libxrender' 'libxrandr' 'libxtst' 'libxext' 'libxfixes' 'libxdamage' 'libxkbfile' 'gcc-libs' 'lsb-release' 'polkit' 'lib32-gtkglext' 'lib32-libxkbfile')
optdepends=('libpulse: audio support' 'gnome-themes-extra: adwaita theme')
provides=('anydesk-atera')
options=('!strip')


source=("https://get.anydesk.com/vYOmIFfJ/anydesk-${pkgver}.tar.gz")

sha256sums=('0a78dada343008d2ddfdc8860ac0bfd21bbada8a6ffa91e2445dd93dcdaa870a')

package() {
    # install binary
    install -Dm 755 "${srcdir}/anydesk-${pkgver}/anydesk" "${pkgdir}/usr/bin/anydesk-atera"

    # install desktop entry
    install -Dm 644 "${srcdir}/anydesk-${pkgver}/anydesk.desktop" "${pkgdir}/usr/share/applications/anydesk-atera.desktop"

    # install polkit action
    install -Dm 644 "${srcdir}/anydesk-${pkgver}/polkit-1/com.philandro.anydesk.policy" "${pkgdir}/usr/share/polkit-1/actions/com.philandro.anydesk.policy"
    # install icon
    install -Dm 644 "${srcdir}/anydesk-${pkgver}/icons/hicolor/scalable/apps/anydesk.svg" "${pkgdir}/usr/share/pixmaps/anydesk-atera.svg"
    # install license
    install -Dm 644 "${srcdir}/anydesk-${pkgver}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    printf "%b" "\e[1;33m==> WARNING: \e[0mAnyDesk has a systemd service for unattended access. Enable it with: systemctl enable --now anydesk-atera\n"
    # install systemd service
    install -Dm 644 "${srcdir}/anydesk-${pkgver}/systemd/anydesk.service" "${pkgdir}/usr/lib/systemd/system/anydesk-atera.service"
}
