# Maintainer: Romain Gallet <romain.gallet at gmail.com>
# Contributor: Romain Gallet <romain.gallet at gmail.com>
_packager="Romain Gallet <romain.gallet at gmail.com>"
pkgver=0.3
pkgname=sabnzbd-docker
pkgrel=2
pkgdesc='Convenience launch service for Sabnzd, Nzbhydra2 and Sonarr in docker'
url="https://github.com/grumlimited/sabnzbd-docker"
arch=('any')
license=('GPL-3.0-or-later')
groups=()
depends=('docker-compose')
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
         '879f3630d2f97a93d92d593fc79c0636'
         'd263106fb3ae8cf5595e870fdc8907c6'
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
