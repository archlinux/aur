# Maintainer: Konarev Alexander <avkonarev@gmail.com.cc>

pkgname=aksusbd
pkgver=7.32
_pkgrel=1
pkgrel=3
pkgdesc="AKSUSB daemon supporting Sentinel HASP, HASP HL, HASP4 and Hardlock keys."
arch=('i686' 'x86_64')
url="http://www.safenet-inc.com/"
license=('custom')
source=(
  "ftp://ftp.cis-app.com/pub/hasp/Sentinel_HASP/Runtime_(Drivers)/7.32/Sentinel_LDK_RedHat_and_SuSE_RPM_Run-time_Installer.tar.gz"
	"aksusbd.service"
	"LICENSE")

makedepends=('rpmextract')

conflicts=('ehaspd')
install=$pkgname.install

prepare(){
  cd $srcdir
  rpmextract.sh Sentinel_LDK_RedHat_and_SuSE_RPM_Run-time_Installer/${pkgname}-${pkgver}-${_pkgrel}.i386.rpm
}

package() {
	cd $srcdir
	# copy package
  mkdir -p $pkgdir/usr/bin
  #install -dm755 "$pkgdir"/{usr/{bin,share}}
	cp -r $srcdir/usr/sbin/* $pkgdir/usr/bin
	cp -r $srcdir/etc $pkgdir/etc

  find $pkgdir/usr -type f -exec chmod 755 {} \;
  find $pkgdir/etc -type f -exec chmod 644 {} \;
  chmod 755 $pkgdir/etc/init.d/aksusbd


	install -Dm644 ${srcdir}/${pkgname}.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
	# copy license
	install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

md5sums=('49a1bbf566741e87b5b61702c95c62e8'
         '9ee94d29752a32e164af2a539f85ec3b'
         '095760c5f93d6b59c337b3a411a479b2')

# vim: set noet ci pi sts=0 sw=4 ts=4:
