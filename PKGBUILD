# Maintainer: Daniel Maslowski <info at orangecms dot org>
pkgname=rkflashtool
_gitname=rkflashtool
pkgver=199.24593f3
pkgrel=1
pkgdesc="Flash tool for Rockchip"
arch=('i686' 'x86_64')
url="http://linux-rockchip.info/mw/index.php?title=Rkflashtool"
license=('GPL')
provides=('rkflashtool')
depends=('libusb')
install='rkflashtool.install'
source=('git://github.com/linux-rockchip/rkflashtool.git')
sha256sums=('SKIP')

pkgver()
{
  cd "${srcdir}/${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build()
{
  cd "${srcdir}/${_gitname}"
  make
}

package()
{
  cd "${srcdir}/${_gitname}"
  make DESTDIR=${pkgdir} install
  mkdir -p "${pkgdir}/etc/udev/rules.d/"
  echo "SUBSYSTEM==\"usb\", ATTR{idVendor}==\"2207\", MODE=\"0666\"" > "${pkgdir}/etc/udev/rules.d/51-rockchip.rules"
}
