pkgname=gvst-vst
pkgver=20210112
pkgrel=3
pkgdesc="GVST Plugin Suite."
arch=('x86_64')
url="https://www.gvst.co.uk/portpage.htm"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('glibc' 'libcurl-gnutls')
makedepends=('xdg-user-dirs' 'unzip')

prepare () {
	## Extract GVST Plugins Archive
	_archive=`xdg-user-dir DOWNLOAD`/AllGVSTLinux64.zip
	ln -srf ${_archive} "$srcdir/`basename ${_archive}`"
	unzip "$srcdir/`basename ${_archive}`"
}

package() {
	## Install GVST
	mkdir -p $pkgdir/usr/lib/vst	
	cp $srcdir/*.so $pkgdir/usr/lib/vst
	
	## Install License
	install -Dm644 "$srcdir/GVSTLicense.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
