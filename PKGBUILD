# Maintainer: Ľubomír 'the-k' Kučera <lubomir.kucera.jr at gmail.com>
# Contributor: Fedor Piecka <teplavoda at gmail dot com>

pkgname=disig-web-signer
pkgver=2.5.2
_upstream_pkgrel=1
pkgrel=1
pkgdesc="Slovak eID Web Signer by Disig"
arch=('i686' 'x86_64')
license=('custom')
url="https://qesportal.sk/"
source_x86_64=("https://download.disigcdn.sk/cdn/products/websigner2/disig-web-signer_${pkgver}-${_upstream_pkgrel}_amd64.deb")
source_i686=("https://download.disigcdn.sk/cdn/products/websigner2/disig-web-signer_${pkgver}-${_upstream_pkgrel}_i386.deb")
sha256sums_x86_64=('f6f4c3ffa5af30018d2624900b452c7211b3b4308493472b67a7bcbd24ae8ee2')
sha256sums_i686=('0166ebc01e032a6a1dee1e55e459cc1c23d5eb5cb5944f7bc21397d39aa53870')
options=("!strip")

# Upstream uses Debian architecture naming convention. Let's prepare a variable for that.
upstream_arch=
[[ "$CARCH" == "x86_64" ]] && upstream_arch="amd64"
[[ "$CARCH" == "i686" ]] && upstream_arch="i386"

package() {
	depends=(
		gcc-libs
		glibc
		openssl-1.1
		qt5-base
		qt5-websockets
		qt5-xmlpatterns
	)

	ar p "${srcdir}/disig-web-signer_${pkgver}-${_upstream_pkgrel}_${upstream_arch}.deb" data.tar.xz | tar -xJ -C "${pkgdir}"

	# The libraries are provided by the system.
	rm -r "${pkgdir}"/opt/disig/websigner/{bin/qt.conf,lib,plugins,share/doc/*/}
}
