# Maintainer: abdalrohman-alnassier <abdd199719@gmail.com>

pkgname=update-motd
pkgver=3.6
pkgrel=0
pkgdesc="compliments pam_motd in libpam-modules"
arch=('i686' 'x86_64')
url="https://launchpad.net/update-motd"
license=('GPLv3')
depends=('show-motd')
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}-${pkgrel}ubuntu7_all.deb")
md5sums=('c3b5630023e3b08a99070e414eed8e8e')

package() {
  msg2 "Check dependencies:"
  if [ -x /etc/profile.d/update-motd.sh ]; then

    msg2 "Extracting the data.tar.xz..."
    bsdtar -xf data.tar.xz -C "${srcdir}"
    msg2 "Moving stuff in place..."
    install -D -m755 ${srcdir}/usr/sbin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -D -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
    install -D -dm755 "${pkgdir}/usr/share/man/man8"
    install -D -dm755 "${pkgdir}/etc/update-motd.d"
    cp -rf ${srcdir}/usr/share/doc/${pkgname}/* "${pkgdir}/usr/share/doc/${pkgname}/"
    cp -rf ${srcdir}/usr/share/man/man8/* "${pkgdir}/usr/share/man/man8/"
  else
    error "Please install (show-motd) from AUR repository and try again."
    exit 1
  fi
}

