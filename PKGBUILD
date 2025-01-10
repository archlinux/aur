# Maintainer: Slavi Pantaleev <slavi at devture.com>

pkgname=bit4id-xpki
pkgver=1.4.10.682
pkgrel=2
pkgdesc="Bit4ID Universal Middleware (Smart Card driver)"
arch=('x86_64')
license=('unknown')
url="http://www.bit4id.com/"
install=$pkgname.install
options=('!strip')
# bit4id-ipki also provides /usr/lib/bit4id/libbit4xpki.so
conflicts=('bit4id-ipki')
md5sums=('bee113c3dfeb52b805fe211739c697a8')

# Goes from `X.Y.Z.A` to `X.Y.Z-A`, to match file names on the source server
pkgver_with_dash=$(echo "${pkgver}" | sed 's/\.\([0-9]\+\)$/-\1/')
_file_name='libbit4xpki-'$pkgver_with_dash'-bit4id-user.'$CARCH'.deb'

source=('https://repository.infonotary.com/ra/Middleware/Bit4id/Linux/'$_file_name)

package() {
    ar -xv $_file_name || return 1
    tar -xvf data.tar.xz -C $pkgdir || return 1

	# Remove pinmanager. It's packaged separately (as `bit4id-pki-manager`).
	rm -rf $pkgdir/usr/share/bit4id/x
}
