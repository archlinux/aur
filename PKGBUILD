pkgname=flexnet
pkgver=11.15.0.0
pkgrel=1
arch=('x86_64')
url='https://developer.arm.com/products/software-development-tools/license-management/downloads'
license=('custom')
options=('emptydirs')
pkgdesc="FlexNet Publisher: license manager"
depends=('ld-lsb')
# download file and uncomment
source=(#"BX002-PT-00007-r11p15-00rel0.tgz"
	"lmgrd.service")
sha256sums=('4060024b9618deb0746c56f2ab6618250fa63a6cb7ac52eedff4c028500b0d39'
            '95d263029a7d0d454cb58d395843dd1dc8415fb44d5bc3f5f5d0708223acaab7')

package() {
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/doc/$pkgname
  cp -r ${srcdir}/{armlmd,armlmdiag,lmgrd,lmutil} ${pkgdir}/usr/bin/
  cp -r ${srcdir}/{fnp_LicAdmin.pdf,ReleaseNotes.pdf} ${pkgdir}/usr/share/doc/$pkgname/

  for i in lmhostid lmver lmcksum lmdown lmremove lmreread \
    lmswitchr lmstat lmdiag lminstall lmpath lmborrow lmswitch; do
      ln -s lmutil ${pkgdir}/usr/bin/$i
  done

  install -Dm0644 ${srcdir}/lmgrd.service ${pkgdir}/usr/lib/systemd/system/lmgrd.service
  install -dm0755 -o nobody -g nobody ${pkgdir}/var/log/flexnet
  install -dm0755 ${pkgdir}/etc/flexnet
}
