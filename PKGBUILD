# Maintainer: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>
# Contributor: Cody Schafer <aur at codyps com>
# Contributor: Chris <alostengineer at narmos org>
# Contributor: Olivier EBLE <olivier.eble at gmail com>
# Contributor: Laszlo Papp <djszapi2 at gmail com>
# Contributor: Justin Gottula <justin at jgottula com>
# Contributor: RJ <private>
pkgname=libftd2xx
pkgver=1.4.24
pkgrel=1
pkgdesc="Library that allows a direct access to a USB FTDI2XX chip based device"
arch=('x86_64')
url="http://www.ftdichip.com/"
license=('Proprietary')
depends=('glibc')
source=(55-ft2232.rules)
sha256sums=('f48e0c36821bebfcf791da0831ce7e10965c5a537e222e54f92cb0b2d4497cda')
sha256sums_x86_64=('994d2a30bd3686afb345af834149455e2de2b9b3d6d0339be2042f19feca6eef')
source_x86_64=(
	http://www.ftdichip.com/Drivers/D2XX/Linux/${pkgname}-x86_64-${pkgver}.gz
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
