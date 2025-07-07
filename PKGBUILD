# Maintainer: Ľubomír 'the-k' Kučera <lubomir.kucera.jr at gmail.com>
# Contributor: Fedor Piecka <teplavoda at gmail dot com>

pkgname=disig-web-signer
pkgver=2.2.0
_upstream_pkgrel=2
pkgrel=1
pkgdesc="Slovak eID Web Signer by Disig"
arch=('i686' 'x86_64')
license=('custom')
url="https://qesportal.sk/"
source_x86_64=("https://download.disigcdn.sk/cdn/products/websigner2/disig-web-signer_${pkgver}-${_upstream_pkgrel}_amd64.deb")
source_i686=("https://download.disigcdn.sk/cdn/products/websigner2/disig-web-signer_${pkgver}-${_upstream_pkgrel}_i386.deb")
sha256sums_x86_64=('05d07b6856a881723e3df94762c66d3e118552cb06100ea7c0ee33f29a752790')
sha256sums_i686=('a31325d2ee164442846076a794279016d5147c713c81b1eaffdc36e857938f0d')
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
