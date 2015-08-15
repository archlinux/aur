# Maintainer: Pouar <thepouar@gmail.com>

pkgname=easytether-rpm
_rpmrel=1
pkgver=0.8.5
pkgrel=1
pkgdesc="Internet access via smartphone"
arch=('x86_64')
url="http://www.mobile-stream.com/easytether/drivers.html"
license=('unknown:freeware')
depends=('glibc' 'libusb' 'udev')
makedepends=('rpmextract')
conflicts=('easytether-bin')
_arch=i686
changelog=CHANGELOG
[ $CARCH == i686 ] && md5sums=('c65052843459c3a5565529526d7a77fe')
[ $CARCH == x86_64 ] && md5sums=('0042ffbc182abda41f1475858508843f') && _arch=x86_64
_file="easytether-${pkgver}-${_rpmrel}.fc20.${_arch}.rpm"
_extglob="!(*.rpm)" # for some reason makepkg doesnt parse extglob correctly, this is a workaround
source=("http://www.mobile-stream.com/beta/fedora/20/${_file}")
build()
{
  cd ${srcdir}
  rpmextract.sh "${_file}"
}

package()
{
cd ${srcdir}
  install -Dm755 ./usr/bin/easytether-usb ${pkgdir}/usr/bin/easytether-usb
  install -Ddm755 ${pkgdir}/var/lib/easytether/empty
}

