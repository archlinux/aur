# Maintainer: Masanori Ohgita <mp_aur[at]ohgita[dot]info>
pkgname=stone
pkgver=2.3e
pkgrel=1
pkgdesc="TCP/IP repeater in the application layer"
url="http://www.gcd.org/sengoku/stone/"
arch=('i686' 'x86_64')
license=('GPL')
optdepends=('openssl: SSL support')
source=(
	"http://www.gcd.org/sengoku/stone/stone-${pkgver}.tar.gz"
	"Makefile.patch"
)
sha256sums=(
	'b2b664ee6771847672e078e7870e56b886be70d9ff3d7b20d0b3d26ee950c670'
	'8c1bb2bcf3f83fc65695410106f0de3b586333b00ecca2da3eb57cf3a980baaf'
)

_archive_dir_ver=2.3d-2.3.2.7

build() {
	
	cd "${srcdir}/${pkgname}-${_archive_dir_ver}/"
	patch -u Makefile < "${srcdir}/Makefile.patch"
	
	which openssl >/dev/null 2>&1
	if [ "$?" -eq 0 ]; then
		make linux-ssl $MAKEFLAGS
	else
		make linux $MAKEFLAGS
	fi
	
}

package() {
	
	cd "${srcdir}/${pkgname}-${_archive_dir_ver}/"
	install -Dm755 stone "${pkgdir}/usr/bin/stone"
	
}

