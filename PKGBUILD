# Contributor: Cody Schafer <aur at codyps com>
# Maintainer: Chris <alostengineer at narmos org>
# Contributor: Olivier EBLE <olivier.eble at gmail com>
# Contributor: Laszlo Papp <djszapi2 at gmail com>
# Contributor: Justin Gottula <justin at jgottula com>
pkgname=libftd2xx
pkgver=1.4.22
pkgrel=3
pkgdesc="Library that allows a direct access to a USB FTDI2XX chip based device"
arch=('i686' 'x86_64')
url="http://www.ftdichip.com/"
license=('Proprietary')
depends=('glibc')

source=(
	55-ft2232.rules
)
sha384sums=('470dd4b34d9f62fa2e6d739804751fe2b635b84ef29312c02d20c572bc371c5f6369cd3bda739fc6987fd886766cd0fd')
sha384sums_i686=('bed1c3ceb3d4c296a0e93e1653338d55ad7f1f5af97e071dc4bc9284b6ae34435ebd42f0d5e325fa007264f6bf9bd1e2')
sha384sums_x86_64=('b5d54d7ff6bec701dd81d2cb56c7535725139aa5cb6dcf0e10f34b6a74bb0d5779768ab7e0fed8abdef25b1e54dce742')

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
