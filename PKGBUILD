# Maintainer: Romain Gallet <romain.gallet at gmail.com>
# Contributor: Romain Gallet <romain.gallet at gmail.com>
_packager="Romain Gallet <romain.gallet at gmail.com>"
pkgver=0.3
pkgname=sabnzbd-docker
pkgrel=2
pkgdesc='Convenience launch service for Sabnzd, Nzbhydra2 and Sonarr in docker'
arch=('x86_64')
license=('MIT')
groups=()
depends=('docker')
makedepends=()
checkdepends=()
optdepends=()
provides=()
backup=()
options=()
install=sabnzbd-docker.install
source=("file://sabnzbd-docker.service"
        "file://sabnzbd-docker-update.timer"
        "file://sabnzbd-docker-update.service"
        "file://docker-compose.yaml"
        "file://default.env"
        "file://docker.env")
md5sums=('09d427d3b1de5bb5d14d674d18b778df'
         '6fd19f267a71ba90a6a4f3177570e416'
         '80456723536c022e86d7e1f9970792ef'
         '86c471c654c795796dbef4f8f2f4bb8f'
         '55a3e51b6074df2959798d99b60e38b4'
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
}
