# Maintainer: Mauro Santos <registo.mailling@gmail.com>

pkgname=systemd-ckboot
pkgver=1.2
pkgrel=1
pkgdesc="Checks boot files and MBR for changes"
arch=('any')
url="https://sourceforge.net/projects/ckboot"
license=('GPL')
depends=('zenity' 'systemd')
backup=('etc/ckboot.conf')
install='ckboot.install'
source=("https://downloads.sourceforge.net/project/ckboot/ckboot-${pkgver}.tar.gz")
md5sums=('b59dac8618371ec58ad9da192e5fbd7c')

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
