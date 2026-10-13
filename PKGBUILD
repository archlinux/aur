#
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
#

pkgname=rpiusbboot-git
pkgver=r514.861a703
pkgrel=1
pkgdesc="Raspberry Pi USB boot"
arch=("i686" "x86_64")
url="https://github.com/raspberrypi/usbboot"
license=("Apache-2.0")
depends=("glibc" "libusb")
conflict=()
source=("${pkgname}::git+https://github.com/raspberrypi/usbboot.git")
md5sums=('SKIP')


pkgver()
{
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
  cd "${srcdir}/${pkgname}"
  make || return 1
}

package()
{
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}/" install
  ln -s rpiboot ${pkgdir}/usr/bin/rpiusbboot

  #install -D rpiboot ${pkgdir}/usr/bin/rpiusbboot
  #install -d ${pkgdir}/etc/udev/rules.d/
  #install -D -m 644 debian/70-rpiboot.rules ${pkgdir}/etc/udev/rules.d/
}

#
# EOF
#
