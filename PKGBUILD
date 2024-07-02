# Maintainer: Slavi Pantaleev <slavi at devture.com>

pkgname=bit4id-pki-manager
pkgver=1.4.10.682
pkgrel=1
pkgdesc="Bit4ID PKI Manager application"
arch=('x86_64')
license=('unknown')
url="http://www.bit4id.com/"
options=('!strip')
md5sums=('bee113c3dfeb52b805fe211739c697a8')
optdepends=(
	'bit4id-ipki: Bit4ID Universal Middleware (Smart Card driver)'
	'bit4id-xpki: Bit4ID Universal Middleware (Smart Card driver)'
)

# Goes from `X.Y.Z.A` to `X.Y.Z-A`, to match file names on the source server
pkgver_with_dash=$(echo "${pkgver}" | sed 's/\.\([0-9]\+\)$/-\1/')
_file_name='libbit4xpki-'$pkgver_with_dash'-bit4id-user.'$CARCH'.deb'

source=('https://repository.infonotary.com/ra/Middleware/Bit4id/Linux/'$_file_name)

package() {
	ar -xv $_file_name || return 1
	tar -xvf data.tar.xz -C $pkgdir || return 1

	# Remove drivers. They are packaged separately (as `bit4id-xpki`).
	rm -rf $pkgdir/usr/lib/bit4id
	rm -rf $pkgdir/usr/share/bit4id/ccid
}
