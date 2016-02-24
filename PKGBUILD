# Contributor: Florian Ziegler <zieglerflorian fastmail fm>
pkgname=grml2usb
pkgver=0.14.13
pkgrel=1
pkgdesc="Installs one or multiple grml ISOs on an USB device - contains grml2iso"
arch=(x86_64)
options=(!strip)
url="http://grml.org/grml2usb/"
license=('GPL2')
depends=('python2' 'bash')
optdepends=('cdrkit: creating multiboot ISOs with grml2iso')
source=(deb_package_${pkgver}_${pkgrel}_amd64.deb::http://deb.grml.org/pool/main/g/grml2usb/${pkgname}_${pkgver}_amd64.deb)
noextract=(deb_package_${pkgver}_${pkgrel}_amd64.deb deb_package_${pkgver}_${pkgrel}_amd64.deb)
md5sums=('4681f99b4ca432c30e2fec9935724441')

package() {
  cd "$srcdir"

  bsdtar -xf deb_package_${pkgver}_${pkgrel}_amd64.deb
  bsdtar -xf data.tar.xz


  install -D -m 755 usr/sbin/grml2usb ${pkgdir}/usr/bin/grml2usb
  install -D -m 755 usr/sbin/grml2iso ${pkgdir}/usr/bin/grml2iso

  sed -i'' -e '1s/python/python2/' ${pkgdir}/usr/bin/grml2usb
  sed -i'' -e '1s/python/python2/' ${pkgdir}/usr/bin/grml2iso

  install -D -m 644 usr/share/man/man8/grml2usb.8.gz ${pkgdir}/usr/share/man/man8/grml2usb.8.gz
  install -D -m 644 usr/share/man/man8/grml2iso.8.gz ${pkgdir}/usr/share/man/man8/grml2iso.8.gz

  install -D -m 644 usr/share/grml2usb/grub/splash.xpm.gz ${pkgdir}/usr/share/grml2usb/grub/splash.xpm.gz
  install -D -m 644 usr/share/grml2usb/grub/grml.png ${pkgdir}/usr/share/grml2usb/grub/grml.png


  install -D -m 644 usr/share/grml2usb/mbr/mbrmgr ${pkgdir}/usr/share/grml2usb/mbr/mbrmgr
  install -D -m 644 usr/share/grml2usb/mbr/mbrldr ${pkgdir}/usr/share/grml2usb/mbr/mbrldr

  install -D -m 644 usr/share/doc/grml2usb/changelog.gz ${pkgdir}/usr/share/doc/grml2usb/changelog.gz
  install -D -m 644 usr/share/doc/grml2usb/copyright ${pkgdir}/usr/share/doc/grml2usb/copyright
  install -D -m 644 usr/share/doc/grml2usb/NEWS.Debian.gz ${pkgdir}/usr/share/doc/grml2usb/NEWS.Debian.gz
  install -D -m 644 usr/share/doc/grml2usb/TODO ${pkgdir}/usr/share/doc/grml2usb/TODO
}
