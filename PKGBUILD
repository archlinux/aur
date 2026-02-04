# Maintainer: Dominik Wetzel <dimonok at web dot de>
# Contributor: usrmusicman
pkgname=gvst-vst-bin
pkgver=20240925
pkgrel=1
pkgdesc="GVST Plugin Suite."
arch=('x86_64' 'i686')
url="https://gvst.uk"
license=('custom')
groups=('pro-audio' 'vst-plugins')
depends=('glibc' 'libcurl-gnutls')
replaces=('gvst-vst')

# Needed to get the cookie for the download
_tmp=`curl -sc cookies.txt https://gvst.uk/Downloads`
DLAGENTS=("https::/usr/bin/curl -b cookies.txt -L -o %o %u")

_url="${url}/Downloads/Get"

source_x86_64=("${_url}/AllGVSTLinux64.zip")
source_i686=("${_url}/AllGVSTLinux32.zip")

md5sums_x86_64=("e5ef7eb3eb7bd1d5bda572c5d6afa293")
md5sums_i686=("4b866fc29297c60fdc9ede09efd3cf2f")

package() {
	## Install GVST
	mkdir -p $pkgdir/usr/lib/vst	
	cp $srcdir/*.so $pkgdir/usr/lib/vst
	
	## Install License
	install -Dm644 "$srcdir/GVSTLicense.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
