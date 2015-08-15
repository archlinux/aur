# Maintainer: Pouar <thepouar@gmail.com>

pkgname=easytether-bin
pkgver=0.8.5
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
source=("http://www.mobile-stream.com/beta/ubuntu/14.04/${_file}")
_extglob="!(*.deb)" # for some reason makepkg doesnt parse extglob correctly, this is a workaround
changelog=CHANGELOG
[ $CARCH == x86_64 ] && md5sums=('c20be7f5c5c80865f8ca0d2a266cdd19')
[ $CARCH == i686 ] && md5sums=('600b827826a346fbc9a32a5d16672463')

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


