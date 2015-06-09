# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=tboot
pkgver=1.8.2
pkgrel=1
pkgdesc="A pre-kernel/VMM module that uses Intel(R) TXT to perform a measured and verified launch of an OS kernel/VMM."
arch=(i686 x86_64)
url="http://sourceforge.net/projects/tboot/"
license=(BSD)
depends=(trousers)
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('d79c28085dea7f986054d3a564c56320c071c6d36ef6fcb63f85d4ee53da461539c773ab0b604396957c2f1e90646f3d432e2acf2e23f18e5280be48328ffcd8')

build() {
  cd "${pkgname}-${pkgver}"

  unset LDFLAGS
  make debug=y
}

package() {
  cd "${pkgname}-${pkgver}"

  make debug=y DISTDIR="${pkgdir}" install

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  cp README COPYING docs/*.txt lcptools/lcptools2.txt lcptools/Linux_LCP_Tools_User_Manual.pdf "${pkgdir}/usr/share/doc/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/man/man8/"
  install -m644 docs/man/*.8 "${pkgdir}/usr/share/man/man8/"
}
