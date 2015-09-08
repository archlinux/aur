# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Kowalczyk Patryk <patryk AT kowalczyk DOT ws>
# Contributor: <John freehaha  at gmail  dot com> - patch paragon-ufsd-3.10_v01.patch
# Contributor: Pradeep Murthy <pradeepmur (at) gmail> (dkms wrapper)

pkgname=ufsd-module-dkms
_pkgname=ufsd-module
pkgver=9.0
_srcdir=Paragon-147-FRE_NTFS_Linux_${pkgver}_Express
pkgrel=1
pkgdesc='Paragon NTFS & HFS for Linux driver. - ACLs removed. DKMS version'
arch=('i686' 'x86_64')
url='http://paragon-software.com/'
license=('custom')
depends=('dkms' 'linux-lts<3.16')
makedepends=('linux-lts-headers')
install=ufsd-module-dkms.install

# Download the file from <http://www.paragon-software.com/home/ntfs-linux-per/download.html>
source=("Paragon-147-FRE_NTFS_Linux_${pkgver}_Express.tar.gz"
        "dkms.conf"
        "remove-lru_cache_add_anon.patch"
)

md5sums=('838702d38c5d51f14f52b2b5312e0f33'
         '22e227efcee141c8c41798b39dbb62f2'
         'f874a41209d93998df1d44f60e96a7bd')

prepare() {
  cd "$_srcdir"
  patch -Np1 -i "$srcdir"/remove-lru_cache_add_anon.patch
}

package() {
  install -dm755 ${pkgdir}/usr/src/${_pkgname}-${pkgver}
  sed "s/%pkgver%/$pkgver/" dkms.conf > ${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf
  cp -RL ${_srcdir}/* ${pkgdir}/usr/src/${_pkgname}-${pkgver}
}
