pkgname=gvst-vst
pkgver=20210112
pkgrel=2
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

	## Extract GVST Manuals
	_pdfdocs=`xdg-user-dir DOWNLOAD`/AllGVSTManuals.zip
	ln -srf $_pdfdocs "$srcdir/`basename ${_pdfdocs}`"
	unzip "$srcdir/`basename ${_pdfdocs}`"
}

package() {

	## Install GVST
	mkdir -p $pkgdir/usr/lib/vst	
	cp $srcdir/*.so $pkgdir/usr/lib/vst

	## Install GVST Manuals
	mkdir -p $pkgdir/usr/share/doc/$pkgname
	cp $srcdir/*.pdf $pkgdir/usr/share/doc/$pkgname
	
	## Install License
	install -Dm644 "$srcdir/GVSTLicense.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
