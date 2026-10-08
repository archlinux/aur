# Maintainer: SoftExpert <softexpert at gmail dot com>

_product=voiden
pkgname=${_product}-beta-bin
_betaver=
#beta.4
pkgver=2.3.1
pkgrel=1
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
provides=(voiden voiden-beta-bin)
conflicts=(
	voiden
	voiden-bin
	voiden-beta-bin
	voiden-appimage
	voiden-beta-appimage
)
options=(
	!strip     # Stripping symbols would break the binary
	!emptydirs # Remove empty directories from package because why not
)
source_x86_64=(
	"${pkgname}-${pkgver}${_betaver}.deb::https://github.com/VoidenHQ/${_product}/releases/download/v${pkgver}${_betaver}/${_product}_${pkgver}${_betaver}_amd64.deb"
	"LICENSE-${pkgver}::https://raw.githubusercontent.com/VoidenHQ/${_product}/refs/heads/main/LICENSE"
)
b2sums_x86_64=('e0aaa314dcd7bb13e53dee7fa88bdfef548e270c4cd44e6747dacdd1660c0a884bf7d67a351eee524361d6f56b6f851fe9e23ef72f72f50bac6d5e66c49ffc0d'
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
