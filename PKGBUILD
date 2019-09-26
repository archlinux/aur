# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc=''
pkgname=xcursor-simple-colorful
pkgver=19.0
pkgrel=1
url=https://github.com/ooxxvv/simple-colorful
license=(GPL3)
arch=(any)
makedepends=(gawk)
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('6c500e40ea6bd970a95ebc8968bdca2a5dca477e868f9db5f443bcb41e25e444468397c33a62ce4822a936e45a6e3927eb8afcd11d4a9d3407c1f695b0aed997')

prepare ()
{
	cd "${pkgname#xcursor-}-${pkgver}"
	sed -i '/^temp_theme=/d' 00_build_theme.sh
}

build ()
{
	cd "${pkgname#xcursor-}-${pkgver}"
	local builddir="$(pwd)/build/simple-colorful"
	mkdir -p "${builddir}"
	yes N | temp_theme="${builddir}" sh 00_build_theme.sh
}

package ()
{
	cd "${pkgname#xcursor-}-${pkgver}"
	mkdir -p "${pkgdir}/usr/share/icons"
	mv "build/simple-colorful" "${pkgdir}/usr/share/icons"
}
