# Maintainer: Romain Gallet <gr211 at users.noreply.github.com>
# Contributor: Romain Gallet <gr211 at users.noreply.github.com>
_packager="Romain Gallet <gr211 at users.noreply.github.com>"
pkgver=0.5
pkgname=sabnzbd-docker
pkgrel=1
pkgdesc='Convenience launch service for Sabnzd, Nzbhydra2 and Sonarr in docker or podman'
url="https://github.com/grumlimited/sabnzbd-docker"
arch=('any')
license=('GPL-3.0-or-later')
groups=()
depends=('docker-compose')
makedepends=()
checkdepends=()
optdepends=('podman-compose')
provides=()
backup=()
options=()
install=sabnzbd-docker.install
source=("file://sabnzbd-docker.service"
        "file://sabnzbd-docker-update.timer"
        "file://sabnzbd-docker-update.service"
        "file://sabnzbd-podman.service"
        "file://sabnzbd-podman-update.timer"
        "file://sabnzbd-podman-update.service"
        "file://docker-compose.yaml"
        "file://default.env"
        "file://docker.env")
md5sums=('09d427d3b1de5bb5d14d674d18b778df'
         'c0abd821b7fa46bf65aacb53802d8f75'
         'd263106fb3ae8cf5595e870fdc8907c6'
         'e126e9677c27f05272f11c2d855a6f32'
         '0ad65ce3028c32f9fdd451c13b8ed2e1'
         'a95e1d7da3736e65446657dd0e98c7ff'
         '86c471c654c795796dbef4f8f2f4bb8f'
         '7101f988ca10464d1332268f7d5126d2'
         '6af9cc13d7ddf3b2721208ef4bdc156f')
noextract=()

package() {
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

	cp sabnzbd-podman.service ${dest}
    cp sabnzbd-podman-update.service ${dest}
    cp sabnzbd-podman-update.timer ${dest}
}
