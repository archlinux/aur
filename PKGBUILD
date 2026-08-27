# Maintainer: SoftExpert <softexpert at gmail dot com>
# Maintainer: Jonas Geiler <aur@jonasgeiler.com>
_product=voiden
pkgname=${_product}-beta-bin
_betaver=1
pkgver=2.3.0
pkgrel=0.${_betaver}
pkgdesc='The offline, Git-native API workspace'
arch=(x86_64)
url='https://voiden.md/'
license=(Apache-2.0)
depends=(
	# As reported by namcap
	alsa-lib
	at-spi2-core
	bash
	cairo
	dbus
	expat
	glib2
	glibc
	gtk3
	libcups
	libgcc
	libstdc++
	libudev
	libx11
	libxcb
	libxcomposite
	libxdamage
	libxext
	libxfixes
	libxkbcommon
	libxrandr
	mesa
	nspr
	nss
	pango
)
provides=(voiden voiden-bin-beta)
conflicts=(
	voiden
	voiden-bin
	voiden-bin-beta
	voiden-appimage
)
options=(
	!strip     # Stripping symbols would break the binary
	!emptydirs # Remove empty directories from package because why not
)
source_x86_64=(
	"${pkgname}-${pkgver}-beta.${_betaver}.deb::https://github.com/VoidenHQ/${_product}/releases/download/v${pkgver}-beta.${_betaver}/${_product}_${pkgver}.beta.${_betaver}_amd64.deb"
	"LICENSE-${pkgver}::https://raw.githubusercontent.com/VoidenHQ/${_product}/refs/heads/main/LICENSE"
)
b2sums_x86_64=('8a25c3a27fcbeb11f6f543929d442396981368d0dc37fe59fba3ea6b8aedf28d6ddbad739fb6c13ce1f0ba444e33e0d69c873ff7c40f6943e9f18c64d65f8cef'
               'c95549a7a4e388e7ad7855f2f9bdd58f2931212ae63f9b7247e4cca8b0824941df12e93c940d52efabfb592079f13bb056bcd1335a8cc91902b2d969106577c2')

prepare() {
	bsdtar -xf "${srcdir}/data.tar.zst" -C "${srcdir}/"
}

package() {
	cp -a \
		"${srcdir}/usr/" \
		"${pkgdir}/usr/"
	install -Dm644 \
		"LICENSE-${pkgver}" \
		"${pkgdir}/usr/share/licenses/${_product}/LICENSE"
}
