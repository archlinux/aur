# Maintainer: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>
# Contributor: Cody Schafer <aur at codyps com>
# Contributor: Chris <alostengineer at narmos org>
# Contributor: Olivier EBLE <olivier.eble at gmail com>
# Contributor: Laszlo Papp <djszapi2 at gmail com>
# Contributor: Justin Gottula <justin at jgottula com>
# Contributor: RJ <private>
pkgname=libftd2xx
pkgver=1.4.27
pkgrel=1
pkgdesc="Library that allows a direct access to a USB FTDI2XX chip based device"
arch=('x86_64')
url="http://www.ftdichip.com/"
license=('Proprietary')
depends=('glibc')
source=(55-ft2232.rules)
sha256sums=('f48e0c36821bebfcf791da0831ce7e10965c5a537e222e54f92cb0b2d4497cda')
sha256sums_x86_64=('537fc9db6e1eea110dd7661982dc49a28de22a4514b588e8a33a21110a5b6b4c')
source_x86_64=("https://ftdichip.com/wp-content/uploads/2022/07/libftd2xx-x86_64-${pkgver}.tgz")

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
