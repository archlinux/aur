# Maintainer: Patrick Oppenlander <patrick.oppenlander@gmail.com>

#
# NOTE: requires paid license
# TODO: missing man pages
#

pkgname=cppcheck-premium
pkgver=22.8.0
pkgrel=1
pkgdesc='Premium (nonfree) version of cppcheck'
conflicts=('cppcheck')
arch=('x86_64')
url='https://www.cppchecksolutions.com/'
license=('custom' 'GPL')
depends=('python-pygments')
source=("https://files.cppchecksolutions.com/${pkgver}/debian/cppcheckpremium-${pkgver}.tar.gz"
	'cppcheck')
sha1sums=('62fa7dfc1ecc802fdf17456b08564a7b56a6bea0'
          'ec77e2fe5e24e3ba3125ea9f145cb8e62193b5b3')

package() {
	# cppcheck premium doesn't search /usr/{lib,share}/cppcheck for files
	# so we need to install to /opt maintaining directory layout. It also
	# fails to find its configuration files if it's called via symlink so
	# we need to put a small script in /usr/bin/ to help it out.
	mkdir -p "${pkgdir}"/opt/cppcheckpremium/
	cp -r "${srcdir}"/cppcheckpremium-"${pkgver}"/* "${pkgdir}"/opt/cppcheckpremium/
	install -Dt "${pkgdir}"/usr/bin/ "${srcdir}"/cppcheck
}
