# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Hyacinthe Cartiaux <hyacinthe (dot) cartiaux (at) free (dot) fr>
# Contributor: damian01w <damian01w (at) gmail (dot) com>

pkgname=kde-servicemenus-encfs
_pkgname=kde-service-menu-encfs
pkgver=0.8
pkgrel=1
pkgdesc="One KDE servicemenu for encFS encrypted directories."
arch=('i686' 'x86_64')
url="https://www.opendesktop.org/p/1231244/"
license=('GPL3')
depends=('plasma-workspace' 'encfs')
_hash_time=($(curl -s "$url"|grep -e "hash =" -e "timetamp ="|sed "s/.*= '\(.*\)';/\1/"))
source=("https://dl.opendesktop.org/api/files/download/id/1524695036/s/${_hash_time[0]}/t/${_hash_time[1]}/u/${_pkgname}-${pkgver}_all.tar.gz")
sha256sums=('d982dbae3334603ad9d73c5712504a854ea672dd003a1067c9a065088ef83197')

build() {
  tar -xvf ${srcdir}/${_pkgname}-${pkgver}_all.tar.gz
  
  cd ${srcdir}/kde-service-menu-encfs-${pkgver}_all
}

package() {
  # We reproduce the steps from the install script  
  mkdir -p ${pkgdir}/usr/bin/
  install -m 755 ${srcdir}/${_pkgname}-${pkgver}_all/bin/* ${pkgdir}/usr/bin/

  mkdir -p ${pkgdir}/usr/share/kservices5/ServiceMenus/
  install -m 644 ${srcdir}/${_pkgname}-${pkgver}_all/ServiceMenus/*.desktop ${pkgdir}/usr/share/kservices5/ServiceMenus/

  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
  install -m 644 ${srcdir}/${_pkgname}-${pkgver}_all/doc/* ${pkgdir}/usr/share/doc/${pkgname}

}
