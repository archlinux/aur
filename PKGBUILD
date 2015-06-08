# Maintainer: Pouar <thepouar@gmail.com>

pkgname=easytether-bin
pkgver=0.8.4
pkgrel=1
_debrel=1
pkgdesc="Internet access via smartphone"
arch=(i686 x86_64)
url=http://www.mobile-stream.com/easytether/drivers.html
license=(unknown:freeware)
depends=(glibc libusb udev)
conflicts=('easytether-rpm')
_filearch=i386
[ "${CARCH}" == "x86_64" ] && _filearch=amd64
_file=easytether_${pkgver}-${_debrel}_${_filearch}.deb
source=("http://www.mobile-stream.com/beta/ubuntu/12.04/${_file}")
_extglob="!(*.deb)" # for some reason makepkg doesnt parse extglob correctly, this is a workaround
changelog=CHANGELOG
[ $CARCH == i686 ] && md5sums=('5b1bbf7d7effc6d345a0c730a494a18d')
[ $CARCH == x86_64 ] && md5sums=('5651c1ef7aa83735f435f0e5081f9b23')

build()
{
  cd ${srcdir}
  bsdtar -xf "${_file}" data.tar.gz
  bsdtar -xf data.tar.gz
  rm data.tar.gz control.tar.gz debian-binary
}

package()
{
  cd ${srcdir}
  install -Dm755 ./usr/bin/easytether-usb ${pkgdir}/usr/bin/easytether-usb
  install -Ddm755 ${pkgdir}/var/lib/easytether/empty
}


