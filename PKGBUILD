# Maintainer: Dominik Wetzel <dimonok at web dot de>
# Contributor: usrmusicman
pkgname=gvst-vst-bin
pkgver=20210127
pkgrel=2
pkgdesc="GVST Plugin Suite."
arch=('x86_64' 'i686')
url="https://www.gvst.co.uk"
license=('custom')
groups=('pro-audio' 'vst-plugins')
depends=('glibc' 'libcurl-gnutls')
replaces=('gvst-vst')

# Needed to get the cookie for the download
_tmp=`curl -sc cookies.txt https://www.gvst.co.uk/packages.htm`
_tmp=`echo ${_tmp} | sed -n 's/.*dlcode=\(.*\)" download.*/\1/p'`
_dlcode=`echo "${_tmp}" | head -1`

DLAGENTS=("https::/usr/bin/curl -b cookies.txt -o %o %u")

_url="${url}/Get/PlugG4/AllGVSTLinux"

source_x86_64=("${_url}64.zip?dlcode=${_dlcode}")
source_i686=("${_url}32.zip?dlcode=${_dlcode}")

md5sums_x86_64=("6e72bbdeea1f42380afadab29d7d6887")
md5sums_i686=("292532d0201359ba5d5c163e5c509035")

package() {
	## Install GVST
	mkdir -p $pkgdir/usr/lib/vst	
	cp $srcdir/*.so $pkgdir/usr/lib/vst
	
	## Install License
	install -Dm644 "$srcdir/GVSTLicense.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
