# Maintainer: zoe <chp321 [at] gmail [dot] com>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: damian01w <damian01w@gmail.com>
# Contributor: giuseppe.benigno(at)gmail.com

# kf5 version kde-servicemenus-encfs

pkgname=kf5-servicemenus-encfs
_pkgname=kde-service-menu-encfs
pkgver=0.5.2
pkgrel=4
pkgdesc="One KDE servicemenu for encfs encrypted directories ; kf5 version"
arch=('i686' 'x86_64')
url="http://www.egregorion.net/"
license=('GPL3')
depends=('plasma-workspace' 'dolphin' 'kdialog' 'encfs')
conflicts=('kde-servicemenus-encfs')
source=("http://www.egregorion.net/works/kde/servicemenus/encfs/${_pkgname}_${pkgver}.tar.gz")
md5sums=('42b10bd668568ce8ffdd25351c0f2d7e')

package() {
  prefix=$(qtpaths --install-prefix)

  mkdir -p ${pkgdir}/usr/bin/
  install -D -m755 ${srcdir}/${_pkgname}_${pkgver}/bin/${_pkgname}.sh ${pkgdir}/usr/bin/
  cd ${pkgdir}/usr/bin/
  mv ${_pkgname}.sh encfs_kmenu.sh
  # --caption is no longer permitted in kdialog parameters :
  sed -i -r 's|(--caption[^}]*}")||g' ${pkgdir}/usr/bin/encfs_kmenu.sh
  sed -i  's/--caption "${msg_config_title} [12]\/2" //' ${pkgdir}/usr/bin/encfs_kmenu.sh

  mkdir -p ${pkgdir}/${prefix}/share/kservices5/ServiceMenus/
  install -D -m644 ${srcdir}/${_pkgname}_${pkgver}/desktop/encfs.desktop ${pkgdir}/${prefix}/share/kservices5/ServiceMenus/

  mkdir -p ${pkgdir}/${prefix}/share/doc/${pkgname}
  install -D -m644 ${srcdir}/${_pkgname}_${pkgver}/doc/* ${pkgdir}/${prefix}/share/doc/${pkgname}
}
