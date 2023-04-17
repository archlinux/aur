# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="sshuttle-gui-bin"
pkgver=0.2
pkgrel=1
pkgdesc="GUI for SShuttle - Transparent proxy server that works as a poor man's VPN. Forwards over ssh."
arch=('x86_64')
url="https://github.com/AKotov-dev/SShuttle-GUI"
license=("GPL3")
conflicts=("${pkgname%-bin}" "${pkgname%-gui-bin}")
depends=('sh' 'glibc' 'glib2' 'gdk-pixbuf2' 'gtk2' 'at-spi2-core' 'pango' 'cairo' 'libx11')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-0.mrx8_amd64.deb")
sha256sums=('9fccc06d6a60b369371fd4a204dca0cd4efc05e060682773815a3e48cc786bb5')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}" --gname root --uname root
    find "${pkgdir}" -type d -exec chmod 755 {} \;
    install -Dm755 -d "${pkgdir}/usr/lib/systemd/system/"
    mv "${pkgdir}/etc/systemd/system/sshuttle.service" "${pkgdir}/usr/lib/systemd/system/"
    rm -rf "${pkgdir}/etc"
}