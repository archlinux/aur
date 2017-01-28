# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Maintainer : David Phillips <dbphillipsnz gmail dot com>
 
pkgname=wkhtmltopdf-static
pkgver=0.12.4
pkgrel=1
pkgdesc="Shell utility to convert HTML to PDF using Webkit and Qt (upstream static build)"
arch=('i686' 'x86_64')
url="http://wkhtmltopdf.org/"
license=('GPL3')
conflicts=('wkhtmltopdf')
provides=("wkhtmltopdf=${pkgver}")
depends=('bzip2' 'expat' 'fontconfig' 'freetype2' 'gcc-libs' 'glib2' 'glibc' 'graphite' 'harfbuzz' 'libjpeg-turbo' 'libpng' 'libx11' 'libxau' 'libxcb' 'libxdmcp' 'libxext' 'libxrender' 'pcre' 'zlib')
optdepends=('icu48: Rendering from HTML uses unicode character encoding')

# Debian packages are already stripped, so don't bother re-attempting
options=('!strip')

source_x86_64=("http://download.gna.org/wkhtmltopdf/0.12/${pkgver}/wkhtmltox-${pkgver}_linux-generic-amd64.tar.xz")
source_i686=("http://download.gna.org/wkhtmltopdf/0.12/${pkgver}/wkhtmltox-${pkgver}_linux-generic-i386.tar.xz")
md5sums_i686=('ce1a2c0b2cf786ccc5d5828c42c99ddd')
md5sums_x86_64=('96b7306cebb9e65355f69f7ab63df68b')

package() {
	cd "${pkgdir}"
	
	mkdir -p usr
	
	msg "Moving all directories into ./usr"
	for dir in "${srcdir}/wkhtmltox/"* ; do
		mv -v ${dir} usr
	done

	#msg "Fixing permissions on:"
	#msg2 "Directories"
	#find ./ -type d -exec chmod -cR 755 "{}" \;

	# Non-bin and non-lib Files => rw-r--r--
	#msg2 "Files"
	#find ./usr/{include,share} -type f -exec chmod -cR 644 "{}" \;
}
