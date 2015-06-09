# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=tboot
pkgver=1.8.3
pkgrel=1
pkgdesc="A pre-kernel/VMM module that uses Intel(R) TXT to perform a measured and verified launch of an OS kernel/VMM."
arch=(i686 x86_64)
url="http://sourceforge.net/projects/tboot/"
license=(BSD)
depends=(trousers)
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('cde961af07c64a7d8b77f64d48e6d9230048135420e78efc6277f32e4df78012b5bbd73e4f2ce1cd6194091ec306cc84c65356865815a7311e140fd2b94f6443')

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
