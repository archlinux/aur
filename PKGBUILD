# Maintainer: Romain Gallet <gr211 at users.noreply.github.com>
# Contributor: Romain Gallet <gr211 at users.noreply.github.com>
_packager="Romain Gallet <gr211 at users.noreply.github.com>"
pkgver=0.5
pkgname=('sabnzbd-docker' 'sabnzbd-podman')
pkgrel=1
pkgdesc='Convenience launch service for Sabnzd, Nzbhydra2 and Sonarr in docker or podman'
url="https://github.com/grumlimited/sabnzbd-docker"
arch=('any')
license=('GPL-3.0-or-later')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
backup=()
options=()
source=("file://sabnzbd-docker.service"
        "file://sabnzbd-docker-update.timer"
        "file://sabnzbd-docker-update.service"
        "file://sabnzbd-podman.service"
        "file://sabnzbd-podman-update.timer"
        "file://sabnzbd-podman-update.service"
        "file://docker-compose.yaml"
        "file://default.env"
        "file://docker.env")
md5sums=('28218eceaa33e2777f8abc6fe8006182'
         'c0abd821b7fa46bf65aacb53802d8f75'
         '4b68561e20a9a4ff85dc3be07032aa1d'
         'e615dec9ab95052952c21beff32ed843'
         '0ad65ce3028c32f9fdd451c13b8ed2e1'
         '7cc3d2e7951881d25b6afe317cccfc6c'
         '86c471c654c795796dbef4f8f2f4bb8f'
         '50488e9c47e2ca980e00623c3b768d82'
         '6af9cc13d7ddf3b2721208ef4bdc156f')
noextract=()

package_sabnzbd-docker() {
    install=sabnzbd-docker.install
    conflicts=('sabnzbd-podman')
    provides=('sabnzbd-podman')
    depends=('docker-compose')

    dest=${pkgdir}/opt/docker-sabnzbd
	mkdir -p ${dest}
	cp docker-compose.yaml ${dest}
	cp default.env ${dest} # for Unit service
	cp docker.env ${dest}/.env # for docker-compose

    dest=${pkgdir}/usr/lib/systemd/user/
	mkdir -p ${dest}
	cp sabnzbd-docker.service ${dest}
	cp sabnzbd-docker-update.service ${dest}
	cp sabnzbd-docker-update.timer ${dest}
}

package_sabnzbd-podman() {
    install=sabnzbd-podman.install
#     conflicts=('sabnzbd-docker')
    provides=('sabnzbd-podman')
    depends=('podman-compose')

    dest=${pkgdir}/opt/podman-sabnzbd
	mkdir -p ${dest}
	cp docker-compose.yaml ${dest}
	cp default.env ${dest} # for Unit service
	cp docker.env ${dest}/.env # for podman-compose

    dest=${pkgdir}/usr/lib/systemd/user/
	mkdir -p ${dest}
	cp sabnzbd-podman.service ${dest}
    cp sabnzbd-podman-update.service ${dest}
    cp sabnzbd-podman-update.timer ${dest}
}
