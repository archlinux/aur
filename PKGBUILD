# Maintainer: Mauro Santos <registo.mailling@gmail.com>

pkgname=systemd-ckboot
pkgver=1.2
pkgrel=2
pkgdesc="Checks boot files and MBR for changes"
arch=('any')
url="https://sourceforge.net/projects/ckboot"
license=('GPL')
depends=('zenity' 'systemd')
backup=('etc/ckboot.conf')
install='ckboot.install'
source=("https://downloads.sourceforge.net/project/ckboot/ckboot-${pkgver}.tar.gz")
sha256sums=('2acf7aaf1fc11542a7319ae7a9b95fb4997030b0e1c129fbb34ddb777a1a0149')

package() {
    # Install files
    install -Dm755 "${srcdir}/ckboot" "${pkgdir}/usr/bin/ckboot"
    mkdir -p "${pkgdir}/etc/profile.d"
    ln -s /usr/bin/ckboot "${pkgdir}/etc/profile.d/ckboot.sh"
    install -Dm755 "${srcdir}/ckboot-check" "${pkgdir}/usr/bin/ckboot-check"
    install -Dm755 "${srcdir}/ckboot-init" "${pkgdir}/usr/bin/ckboot-init"
    install -Dm644 "${srcdir}/ckboot.service" "${pkgdir}/usr/lib/systemd/system/ckboot.service"
    install -Dm644 "${srcdir}/ckboot.conf" "${pkgdir}/etc/ckboot.conf"
    install -Dm644 "${srcdir}/ckboot.desktop" "${pkgdir}/etc/xdg/autostart/ckboot.desktop"
    
    # Enable unit
    mkdir "${pkgdir}/usr/lib/systemd/system/basic.target.wants"
    ln -s ../ckboot.service "${pkgdir}/usr/lib/systemd/system/basic.target.wants/ckboot.service"
}
