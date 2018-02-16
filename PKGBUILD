# Maintainer: Laszlo Papp <lpapp@kde.org>
pkgname=adduser-deb
_pkgname=adduser
pkgver=3.113+nmu3
pkgrel=1
pkgdesc="Add and remove users and groups from Debian"
arch=('any')
url="http://alioth.debian.org/projects/adduser/"
license=('GPLv2')
depends=('gawk')
# source=("https://launchpad.net/debian/+archive/primary/+files/${_pkgname}_${pkgver}%2Bnmu3.tar.gz")
source=("https://launchpad.net/debian/+archive/primary/+files/${_pkgname}_${pkgver}.tar.gz")
md5sums=('ccb5864bde56683182c89c44474e7182')

package() {
  install -D -m755 ${_pkgname}-${pkgver}/adduser "${pkgdir}/usr/bin/adduser"
  install -D -m755 ${_pkgname}-${pkgver}/deluser "${pkgdir}/usr/bin/deluser"
  ln -s adduser "${pkgdir}/usr/bin/addgroup"
  ln -s deluser "${pkgdir}/usr/bin/delgroup"
  install -D -m755 ${_pkgname}-${pkgver}/adduser.conf "${pkgdir}/etc/adduser.conf"
  install -D -m755 ${_pkgname}-${pkgver}/deluser.conf "${pkgdir}/etc/deluser.conf"
  install -D -m755 ${_pkgname}-${pkgver}/AdduserCommon.pm "${pkgdir}/usr/share/perl5/vendor_perl/Debian/AdduserCommon.pm"
  sed -i "s/'-w',$gecos_work/'-p',$gecos_work/" ${pkgdir}/usr/bin/adduser
  sed -i "s/'-r', $gecos_room/'-o', $gecos_room/" ${pkgdir}/usr/bin/adduser
}

# vim:set ts=2 sw=2 et:

