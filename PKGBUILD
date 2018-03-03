# Maintainer: Nicola Hinssen <nicola.hinssen@gmail.com>
# Contributor: Rowan Decker <rdecker@scu.edu>
# Contributor: Donald Webster <fryfrog@gmail.com>
# Contributor: Zack Baldwin <zack@zackb.com>

pkgname=ombi-beta
pkgver=3.0.2959
pkgrel=1
pkgdesc="Ombi v3.0 Open Beta. Gives Plex or Emby users the ability to request content by themselves"
arch=('any')
url='https://www.ombi.io'
license=('GPL2')
depends=('libunwind')
makedepends=('tar')
optdepends=('sonarr' 'radarr' 'plex-media-server' 'emby-server')
replaces=('plexrequests')
provides=('ombi')
conflicts=('ombi')
options=('staticlibs')
backup=('opt/Ombi/Ombi.sqlite')
install='ombi.install'
noextract=("${pkgname}.tar.gz")
source=("${pkgname}.tar.gz::https://ci.appveyor.com/api/projects/tidusjar/requestplex/artifacts/linux.tar.gz?branch=DotNetCore"
        'ombi.service'
        'ombi.sysusers')
sha256sums=('1e6b2e0c1fa00734d7dd17e0967412d1c47f2a96339a6129aa7d65e5c516298d'
            '601f9ba604c6767722397db977a9d73e800127d4a33c5511439e112d22660eba'
            '480941bb5c96b9e6a155d6feca16f56c74d7f13a49fc94f36132a548bd53dc0a')

pkgver() {
  curl -s https://ci.appveyor.com/api/projects/tidusjar/requestplex | grep -Pom 1 '"version":"\K[^"]*'
}

package() {
  install -dm755 "${pkgdir}/opt/Ombi"
  tar xzf "${pkgname}.tar.gz" -C "${pkgdir}/opt/Ombi"
  chmod +x "${pkgdir}/opt/Ombi/Ombi"
  install -Dm644 "${srcdir}/ombi.service" "${pkgdir}/usr/lib/systemd/system/ombi.service"
  install -Dm644 "${srcdir}/ombi.sysusers" "${pkgdir}/usr/lib/sysusers.d/ombi.conf"
}
