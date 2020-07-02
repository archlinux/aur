# PKGBUILD courtesy of the Arch Wiki	
# Contributor: sudhip n <sudhip at nashi dot u s>
# Original creator: abbi@github : https://github.com/abbbi/nullfsvfs

_pkgname=nullfs
pkgname=nullfs-dkms
pkgver=1
pkgrel=2
pkgdesc="nullfsvfs is a null filesystem that acts like /dev/null but can be mounted"
arch=(any)
license=('GPL2')
depends=('dkms')
source=("https://github.com/Finermeerkat137/nullfsvfs/archive/"$pkgver"-"$pkgrel".tar.gz")
md5sums=('ac61125d3d0a8643944899d10759e7e0')

package() {
  cd ""$srcdir"/"$_pkgname"-"$pkgver"-"$pkgrel""
  make

  install -Dm644 debian/nullfsvfs.dkms "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf

    echo ${pkgdir}
    sed -e "s/@_PKGBASE@/${_pkgname}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf

  cp -r ./* "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/
}
