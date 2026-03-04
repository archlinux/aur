pkgname=zerofs-bin
pkgver=1.0.6
pkgrel=1
pkgdesc="The Filesystem That Makes S3 your Primary Storage. ZeroFS is 9P/NFS/NBD on top of S3."
arch=('x86_64' 'aarch64')
url="https://github.com/Barre/ZeroFS"
conflicts=('zerofs' 'zerofs-git')
license=('AGPLv3')

source=(zerofs-pgo-multiplatform-$pkgver.tar.gz::"https://github.com/Barre/ZeroFS/releases/download/v$pkgver/zerofs-pgo-multiplatform.tar.gz")
sha256sums=('f49c45afa3476eeb0bc578576fe8ab41d0b74c06041d3e10e6822993e717cdee')

package() {
	case $CARCH in
		x86_64)
			_carch=amd64
			;;
		aarch64)
			_carch=arm64
			;;
		*)
			;;
	esac
	msg "CARCH: $CARCH, using zerofs-linux-$_carch-pgo"
	install -D -m 0655 -o root -g root $srcdir/zerofs-linux-$_carch-pgo $pkgdir/usr/bin/zerofs	
}
