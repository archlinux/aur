# Contributor: judd <jvinet@zeroflux.org>
# Contributor: dkaylor <dpkaylor@gmail.com>
# Contributor: Pablo Lezaeta <prflr88@gmail.com>
# Maintainer: Allen Wild <allenwild93@gmail.com>

pkgname=xfsdump
pkgver=3.1.8
pkgrel=5
pkgdesc="Additional XFS filesystem utilities"
arch=(i686 x86_64)
url="http://xfs.org"
license=('GPL')
depends=('xfsprogs' 'attr' 'acl' 'dmapi')
source=(https://kernel.org/pub/linux/utils/fs/xfs/xfsdump/xfsdump-${pkgver}.tar.{xz,sign})
# Eric R. Sandeen <sandeen@sandeen.net>
validpgpkeys=('2B8185919E8D248981869DED20AE1692E13DDEE0')
sha256sums=('ed14e67ae5b273c2698e767b43a46f033d361e540fe13feaaf9b110ee0edc585'
            'SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sbindir=/usr/bin INSTALL_USER=root INSTALL_GROUP=root
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # root /sbin directory can't be overridden properly with configure,
  # so move files manually
  mv -vf "${pkgdir}/sbin/"* "${pkgdir}/usr/bin/"
  rmdir "${pkgdir}/sbin"
}
