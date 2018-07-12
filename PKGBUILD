# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>

pkgname=plex-media-player-standalone-service
pkgver=1.0
pkgrel=4
pkgdesc="Systemd service and user to run PMP in stand-alone mode"
arch=('x86_64')
url="https://github.com/hv15/plex-media-player-standalone-service"
license=('GPL')
depends=('systemd' 'xorg-server' 'xorg-xinit' 'plex-media-player' 'polkit')
install="${pkgname}.install"
source=("https://github.com/hv15/${pkgname}/archive/${pkgver}.tar.gz"
        "https://github.com/hv15/${pkgname}/releases/download/${pkgver}/${pkgver}.tar.gz.sig"
        "plex-media-player."{sysusers,tmpfiles})
sha256sums=('a231685b9eed6ccfb0eefcf40b89b823ff8d33954c4daa2d68ed386ac73e172b'
            'SKIP'
            'b0fbffc7a8823b0b543dba8cb6d2ad4aa0ef3ec066753de1455f891bee32937d'
            '8c3a5069f2a3e2f6d3474e963e41e0e3eb934fef7211dd060d3e49fcd77a8ad8')
validgpgkeys=('0C13DFCDC33937FCF36BEF459062A1BF982A2B64')

prepare() {
    # we change ther user/group of the service file to pplex.
    sed -i 's/\(User\|Group\) = plex/\1 = pplex/' "${srcdir}/${pkgname}-${pkgver}/plexmediaplayer.service"
}

package() {
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/plexmediaplayer.service" \
		"${pkgdir}/usr/lib/systemd/system/plexmediaplayer.service"
    install -Dm644 "${srcdir}/plex-media-player.sysusers" "${pkgdir}/usr/lib/sysusers.d/plex-media-player.conf"
    install -Dm644 "${srcdir}/plex-media-player.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/plex-media-player.conf"
}
