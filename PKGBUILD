# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=dahdi-linux-gentoo
_realpkgname=${pkgname:0:11}
pkgver=2.10.2
pkgrel=1
pkgdesc="DAHDI drivers for Asterisk"
arch=('i686' 'x86_64')
url="http://www.asterisk.org/"
license=('GPL2')
depends=('linux' 'libusb' 'perl')
makedepends=('linux-headers')
conflicts=('dahdi' 'dahdi-linux')
install="${_realpkgname}.install"
source=("http://downloads.asterisk.org/pub/telephony/${_realpkgname}/${_realpkgname}-${pkgver}.tar.gz"
	"http://downloads.digium.com/pub/telephony/firmware/releases/dahdi-fw-a4a-a0017.tar.gz"
	"http://downloads.digium.com/pub/telephony/firmware/releases/dahdi-fw-a4b-d001e.tar.gz"
	"http://downloads.digium.com/pub/telephony/firmware/releases/dahdi-fw-a8a-1d0017.tar.gz"
	"http://downloads.digium.com/pub/telephony/firmware/releases/dahdi-fw-a8b-1f001e.tar.gz"
	"http://downloads.digium.com/pub/telephony/firmware/releases/dahdi-fw-hx8-2.06.tar.gz"
	"http://downloads.digium.com/pub/telephony/firmware/releases/dahdi-fw-oct6114-032-1.05.01.tar.gz"
	"http://downloads.digium.com/pub/telephony/firmware/releases/dahdi-fw-oct6114-064-1.05.01.tar.gz"
	"http://downloads.digium.com/pub/telephony/firmware/releases/dahdi-fw-oct6114-128-1.05.01.tar.gz"
	"http://downloads.digium.com/pub/telephony/firmware/releases/dahdi-fw-oct6114-256-1.05.01.tar.gz"
	"http://downloads.digium.com/pub/telephony/firmware/releases/dahdi-fw-tc400m-MR6.12.tar.gz"
	"http://downloads.digium.com/pub/telephony/firmware/releases/dahdi-fw-te133-7a001e.tar.gz"
	"http://downloads.digium.com/pub/telephony/firmware/releases/dahdi-fw-te134-780017.tar.gz"
	"http://downloads.digium.com/pub/telephony/firmware/releases/dahdi-fw-te435-13001e.tar.gz"
	"http://downloads.digium.com/pub/telephony/firmware/releases/dahdi-fw-te436-10017.tar.gz"
	"http://downloads.digium.com/pub/telephony/firmware/releases/dahdi-fw-te820-1.76.tar.gz"
	"http://downloads.digium.com/pub/telephony/firmware/releases/dahdi-fw-vpmoct032-1.12.0.tar.gz"
	"http://downloads.digium.com/pub/telephony/firmware/releases/dahdi-fwload-vpmadt032-1.25.0.tar.gz"
	"http://mirror.netcologne.de/gentoo/distfiles/gentoo-dahdi-patchset-1.2.3.tar.bz2"
	"http://www.junghanns.net/downloads/jnet-dahdi-drivers-1.0.14.tar.gz"
	"dahdi.service")
sha256sums=('6270444cb9b345941267b162038cc45f5ef4485139176e88e2c4d22fa35a2c59'
	    'd5b6ab6851e431afcfec2ecc39d95fa88fe3939ffdb2e3d4f28a43cabf30e95b'
	    'e039af8bec36407b74e1dd9ebdd49ba077469eda79d4e6093721ed2836d4536f'
	    '5064f9877b8aec99b19fd57988216fe1a9c0b7c07853dd3b32b5a55ab7b418e6'
	    '09a8992786309e025aa60b400a2c7d21226ac9bb6f1b66f562a5e7e9dc892b03'
	    '449ab3fd03d55d808e999efb7677cd04de202b92c9fcb039539a7e48a39a80f5'
	    '7a006073202d67e45f1d5ff1e9c6e8663e6056cef9dc4c5abae86a1018db349c'
	    '56bac1f2024c76ecf9b6f40992eeea29a1fbee676bb2a37a058179bacfbb1c91'
	    'e1146749d205c41603b9b76852c3f8104dac233d0025d700db24504d10c99775'
	    '5fe5036a2766cf0e8a968b0c58b700507d86e1cde9296ca437170cc626a9c79c'
	    '11dd8d009809e41fc9a3a36766f59ff73d29075eede5b8724331d9a6e5259774'
	    '511c1966295a20df673bb87af30245f0ad165efd6ccb92b4d8ed535ca7f5ac65'
	    '99f7c410bf47d2a5ae687d717e51448ce5b52aca902830bf39bffe683150fa2d'
	    'c8f55d57cc0bf332e8d96cdf9ff6dd0e322f33581e1efc24c2b9a0e0c5eb7ee4'
	    '0980f4a8d191c6872aa27d971758046f0e7827ac161549f2cc1b0eeab0ae9333'
	    '5b823e25828e2c1c6548886ad408b2e31dbc8cd17170c52592792d9c754a199c'
	    '6b199cf836f150f9cb35f763f0f502fb52cfa2724a449b500429c746973904ad'
	    '3ff26cf80555fd7470b43a87c51d03c1db2a75abcd4561d79f69b6c48298e4a1'
	    '4bd57ffa61d718b847080af274fdf2414bf83a6567dffa05786e3e9b900cdf5f'
	    'c71d1ac29c78511b59914cc9aa1798529ae7b344cdc8403a797dbcddbe486974'
	    '7c91314aacab22ffd02794abfa7db49f44a796ea54f3e2bc4276616e68b90e0f')
build() {
  cd "${srcdir}/${_realpkgname}-${pkgver}"
  ln -sf "${srcdir}"/dahdi-fw*.tar.gz "drivers/dahdi/firmware/"

  # junghanns hw
  cp "${srcdir}"/jnet-dahdi-drivers-1.0.14/cwain/*.[ch] "drivers/dahdi/"
  cp "${srcdir}"/jnet-dahdi-drivers-1.0.14/qozap/*.[ch] "drivers/dahdi/"
  cp "${srcdir}"/jnet-dahdi-drivers-1.0.14/ztgsm/*.[ch] "drivers/dahdi/"

  # patches and other non-digium hw
  patch -Np1 -i "${srcdir}/dahdi-patchset/01-no-depmod.diff"
  patch -Np1 -i "${srcdir}/dahdi-patchset/02-parallel-make.diff"
  patch -Np1 -i "${srcdir}/dahdi-patchset/03-grsecurity-no-constify.diff"
  patch -Np1 -i "${srcdir}/dahdi-patchset/04-dahdi-irq-shared.diff"
  patch -Np1 -i "${srcdir}/dahdi-patchset/98-non-digium-hardware-and-oslec.diff"
  patch -Np1 -i "${srcdir}/dahdi-patchset/99-irqf-disabled.diff"

  # fix wrong installation paths
  sed 's,$(DESTDIR)/lib/firmware,$(DESTDIR)/usr/lib/firmware,g' -i drivers/dahdi/firmware/Makefile
  sed 's,$DESTDIR/lib/firmware,$DESTDIR/usr/lib/firmware,g' -i build_tools/install_firmware

  make DESTDIR="${pkgdir}" DAHDI_MODULES_EXTRA="cwain.o qozap.o ztgsm.o" all
}

package() {
  cd "${srcdir}/${_realpkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install-firmware
  make DESTDIR="${pkgdir}" install-include
  make DESTDIR="${pkgdir}" install-xpp-firm

  # beautifying firmware directory
  rm ${pkgdir}/usr/lib/firmware/.d*

  cd drivers
  find . -name "*.ko" -exec gzip "{}" \; -exec install -D -m 0644 "{}.gz" "${pkgdir}/usr/lib/modules/extramodules-`uname -r | cut -c 1-3`-ARCH/{}.gz" \;
}
