# Maintainer:  Travis Collins <erbrecht at pobox dot com>

pkgname=noisetorch-bin
pkgver=0.4.0_beta
pkgrel=2
pkgdesc='Easy to use noise suppression for PulseAudio'
arch=('x86_64')
url="https://github.com/lawl/NoiseTorch"
license=('GPL3')
depends=('polkit')
optdepends=('hicolor-icon-theme')
provides=('noisetorch')
backup=("${HOME#/*}/.config/noisetorch/config.toml")
options=(!strip)
install="${pkgname}.install"
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/lawl/NoiseTorch/releases/download/${pkgver/_/-}/NoiseTorch_x64.tgz"
	"${pkgname}.install"
)
sha256sums=('dd551296f819887e6d0111015b259fa347aa40ced7813b6247a71712ad45452f'
            '4074b71327284b1ad75aee32bee0462360b90061237e998bf4f7e259a65e3caa')

package() {
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/applications"

	install -m755 .local/bin/noisetorch "${pkgdir}/usr/bin/noisetorch"
	install -m644 .local/share/applications/noisetorch.desktop \
		"${pkgdir}/usr/share/applications/noisetorch.desktop"

	if [[ -d "/usr/share/icons/hicolor/256x256/apps/" ]]
	then
		mkdir -p "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
		install -m644 .local/share/icons/hicolor/256x256/apps/noisetorch.png \
			"${pkgdir}/usr/share/icons/hicolor/256x256/apps/noisetorch.png"
	fi
}
