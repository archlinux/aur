# Contributor: Cody Schafer <aur at codyps com>
# Maintainer: Chris <alostengineer at narmos org>
# Contributor: Olivier EBLE <olivier.eble at gmail com>
# Contributor: Laszlo Papp <djszapi2 at gmail com>
pkgname=libftd2xx
pkgver=1.4.8
pkgrel=2
pkgdesc="Library that allows a direct access to a USB FTDI2XX chip based device"
arch=('i686' 'x86_64')
url="http://www.ftdichip.com/"
license=('Proprietary')
depends=('glibc' 'libusbx>=1.0.8')

source=(
	55-ft2232.rules
)
sha384sums=('470dd4b34d9f62fa2e6d739804751fe2b635b84ef29312c02d20c572bc371c5f6369cd3bda739fc6987fd886766cd0fd')
sha384sums_i686=('d9fcb395a7c69a1f4296d2ce41a8ca9a01ba5047db96a98d2f6b7256f886cf71eb5e024d434166a75b61236a7c2e9fbf')
sha384sums_x86_64=('5643b681c549c18c8830fcaa1a55f0a27eac4e8ff87bbb32de1b1efaf3a926ab008444c416efc222a4d042b065c61fc7')

source_i686=(
	http://www.ftdichip.com/Drivers/D2XX/Linux/${pkgname}-i386-${pkgver}.tgz
)

source_x86_64=(
	http://www.ftdichip.com/Drivers/D2XX/Linux/${pkgname}-x86_64-${pkgver}.tgz
)

package() {
	# Make required dirs
	mkdir -p ${pkgdir}/usr/{lib,include}

	# Install versioned so file as well as static library
	install -Dm755 ${srcdir}/release/build/${pkgname}.so.${pkgver} ${pkgdir}/usr/lib/${pkgname}.so.${pkgver}
	install -m644 ${srcdir}/release/build/${pkgname}.a ${pkgdir}/usr/lib/${pkgname}.a

	# Link versioned so file to generic
  	ln -sf /usr/lib/${pkgname}.so.${pkgver} "${pkgdir}"/usr/lib/${pkgname}.so
  
  
  	# Install Headers
	install -m644 "${srcdir}"/release/{ftd2xx,WinTypes}.h "${pkgdir}"/usr/include/

	# Install udev rules
	install -D -m644 "${srcdir}"/55-ft2232.rules "${pkgdir}"/etc/udev/rules.d/55-ft2232.rules
}
