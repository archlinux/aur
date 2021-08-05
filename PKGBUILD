# Maintainer: Fedor Piecka <teplavoda at gmail dot com>

pkgname=eidklient
pkgver=3.7.0
pkgrel=1
pkgdesc="Slovak eID Client"
arch=('i686' 'x86_64')
url="https://www.slovensko.sk/"
license=('custom')
source_i686=('https://eidas.minv.sk/TCTokenService/download/linux/debian/Aplikacia_pre_eID_i386_debian.tar.gz')
source_x86_64=('https://eidas.minv.sk/TCTokenService/download/linux/debian/Aplikacia_pre_eID_amd64_debian.tar.gz')
md5sums_i686=('SKIP')
md5sums_x86_64=('SKIP')
options=("!strip")
install=eidklient.install

# Upstream uses Debian architecture naming convention. Let's prepare a variable for that.
upstream_arch=
[[ "$CARCH" == "x86_64" ]] && upstream_arch="amd64"
[[ "$CARCH" == "i686" ]] && upstream_arch="i386"


pkgver() {
	# Match Debian package version
	ar p ${srcdir}/Aplikacia_pre_eID_${upstream_arch}_debian.deb control.tar.gz | tar -Oxz ./control | grep ^Version: | cut -f2 -d" " | tr -d '[:space:]'
}

package() {
        depends=("glibc" "pcsclite" "ccid" )

	ar p ${srcdir}/Aplikacia_pre_eID_${upstream_arch}_debian.deb data.tar.xz | tar -xJ -C "${pkgdir}"
	
}
