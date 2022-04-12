# Maintainer:  Travis Collins <erbrecht at pobox dot com>
# Co-maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=noisetorch-bin
pkgver=0.11.5
pkgrel=1
pkgdesc='Easy to use noise suppression for PulseAudio'
arch=('x86_64')
url="https://github.com/lawl/NoiseTorch"
license=('GPL3')
depends=('polkit')
provides=('noisetorch')
conflicts=('noisetorch-git' 'noisetorch')
options=(!strip)
install="${pkgname}.install"
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/lawl/NoiseTorch/releases/download/${pkgver/_/-}/NoiseTorch_x64.tgz"
	"${pkgname}.install"
    "noisetorch-pulse.service"
    "noisetorch-pipewire.service"
)
sha256sums=('c8105a576fbbf79622105228e957cec80a27bce9e5b9b224ef9dfe87fe82f97b'
            '84359c186c870220eeb56e9750319bb0c334c1440dd0f974df9e21a4084f80a5'
            'bad2997f5eb4a9de50ce906187e4a34543c03b6803039bc79031ebee198b05bd'
            '2dd8842ce40faf71ab5e87a96c3bf2a90e5e1a9118d5060b5b9b33abdfeded73')

package() {
	install -D -m755 .local/bin/noisetorch "${pkgdir}/usr/bin/noisetorch"
	install -D -m644 .local/share/applications/noisetorch.desktop \
		"${pkgdir}/usr/share/applications/noisetorch.desktop"

    install -D -m644 noisetorch-{pulse,pipewire}.service \
        -t "${pkgdir}/usr/lib/systemd/user/"

	install -D -m644 .local/share/icons/hicolor/256x256/apps/noisetorch.png \
		"${pkgdir}/usr/share/icons/hicolor/256x256/apps/noisetorch.png"
}
