# maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=noisetorch-bin
pkgver=0.12.2
pkgrel=1
pkgdesc='Easy to use noise suppression for PulseAudio'
arch=('x86_64')
url="https://github.com/noisetorch/NoiseTorch"
license=('GPL3')
depends=('polkit')
provides=('noisetorch')
conflicts=('noisetorch-git' 'noisetorch')
options=(!strip)
install="${pkgname}.install"
source=(
	"${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/NoiseTorch_x64_v${pkgver}.tgz"
	"${pkgname}.install"
    "noisetorch-pulse.service"
    "noisetorch-pipewire.service"
)
sha512sums=('e5af9d6ce0877715382f8c542bddf0cdbc45c13507448ea742b358f8d6eb364c7461a27cb0b4904102af809572ba0f9686634aebcba44adec2f999cb6a537861'
            'dc16b78546d6e21810516af83dfe585b84b5d7cec08b492ca74af02b1f4eb375264ec575f3aeab04cc5b978f355fc684d3a3af2510e6001009f4cd5b1fd92a9d'
            '3a8eb6ebe21ebcd5a6ae190393d2a7b4e472370942d4233d771e18b8ac8357e0f194c5fa47aaab893ee04139606990f7ff019da620b1545303d71daa149b7c6e'
            '0b1e2d036282c46a458b411807edbeb3040273a6ca3c8b1e0c2f95e1522318aafd352e88d22ac907b5995fac347372f7e774dd4de4e4396944cc1134ec51c9dd')

package() {
	install -D -m755 .local/bin/noisetorch "${pkgdir}/usr/bin/noisetorch"

    # desktop entry
	install -D -m644 .local/share/applications/noisetorch.desktop \
		"${pkgdir}/usr/share/applications/noisetorch.desktop"
	install -D -m644 .local/share/icons/hicolor/256x256/apps/noisetorch.png \
		"${pkgdir}/usr/share/icons/hicolor/256x256/apps/noisetorch.png"

    # user service files
    install -D -m644 noisetorch-{pulse,pipewire}.service \
        -t "${pkgdir}/usr/lib/systemd/user/"
}
