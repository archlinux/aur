# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=funnelweb
pkgver=3.2.0
pkgrel=2
pkgdesc='A powerful literate-programming macro preprocessor.'
arch=(any)
url='http://www.ross.net/funnelweb/'
license=('GPL-2.0')
install=funnelweb.install
source=('http://www.ross.net/funnelweb/download/funnelweb_v320/funnelweb_v320_source.tar.gz'
	'funnelweb.install')
md5sums=('5846515b9d24c9b40a23da8afc857a2c'
         'de9940b55d62bc805285aeb3d4fecf5f')
sha1sums=('4e361f6fc3dbb4c1021ccb80eaf0b66a7dfd460e'
          '9965fd7ccd54738aa2e315b540e562b58275b855')
sha256sums=('8f13cb6fd3f4d2563bb41bd13509550db14bd78a68da2a42cb4bbd2481f6107f'
            'f678bdf05c6ddf2e85021f01c2d1bc6e974f01457504d26384e0106697becdaf')

build() {
	cd "$srcdir/fw_src/source"
	export CFLAGS="$CFLAGS -std=gnu99"
	gcc $CFLAGS $LDFLAGS -o fw *.c
}

package() {
	cd "$srcdir/fw_src/"
	mkdir -p $pkgdir/usr/{bin,share/funnelweb,share/texmf/tex/$pkgname}
	install -D -m755 source/fw          $pkgdir/usr/bin/fw
	install -D -m644 source/texhead.tex $pkgdir/usr/share/texmf/tex/$pkgname/texhead.tex
	install -D -m644 admin/0readme.txt  $pkgdir/usr/share/doc/$pkgname/README
	cd $pkgdir/usr/bin
	ln -s fw funnelweb
}
