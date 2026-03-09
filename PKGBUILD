# Maintainer: Ľubomír 'the-k' Kučera <lubomir.kucera.jr at gmail.com>
# Contributor: Fedor Piecka <teplavoda at gmail dot com>

pkgname=disig-web-signer
pkgver=2.5.3
_upstream_pkgrel=1
pkgrel=2
pkgdesc="Slovak eID Web Signer by Disig"
arch=('i686' 'x86_64')
license=('LicenseRef-custom')
url="https://qesportal.sk/"
source_x86_64=("https://download.disigcdn.sk/cdn/products/websigner2/disig-web-signer_${pkgver}-${_upstream_pkgrel}_amd64.deb")
source_i686=("https://download.disigcdn.sk/cdn/products/websigner2/disig-web-signer_${pkgver}-${_upstream_pkgrel}_i386.deb")
sha256sums_i686=('d7adb24595af4fa66dfb34418618aeccf2227820e287dc84ef513d71422ac790')
sha256sums_x86_64=('a4742b2ba695caee8797aefa9b0575eacbf972612f3bad323100bcd288aebd59')
options=("!debug" "!strip")

# Upstream uses Debian architecture naming convention. Let's prepare a variable for that.
_upstream_arch=
[[ "$CARCH" == "x86_64" ]] && _upstream_arch="amd64"
[[ "$CARCH" == "i686" ]] && _upstream_arch="i386"

package() {
	depends=(
		glibc
		libgcc_s.so
		libstdc++.so
		openssl-1.1
		qt5-base
		qt5-websockets
		qt5-xmlpatterns
		sh
	)

	ar p "${srcdir}/disig-web-signer_${pkgver}-${_upstream_pkgrel}_${_upstream_arch}.deb" data.tar.xz | tar -xJ -C "${pkgdir}"

	# The libraries are provided by the system.
	rm -r "${pkgdir}"/opt/disig/websigner/{bin/qt.conf,lib,plugins,share/doc/*/}

	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s /opt/disig/websigner/share/doc/copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
