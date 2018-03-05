# Maintainer: Nicola Hinssen <nicola.hinssen@gmail.com>
# Contributor: Rowan Decker <rdecker@scu.edu>
# Contributor: Donald Webster <fryfrog@gmail.com>
# Contributor: Zack Baldwin <zack@zackb.com>

pkgname=ombi-dev
pkgver=3.0.2980
pkgrel=1
pkgdesc="Ombi V3 Develop branch. Gives Plex or Emby users the ability to request content by themselves"
arch=('any')
url='https://www.ombi.io'
license=('GPL2')
depends=('libunwind')
makedepends=('tar')
optdepends=('sonarr' 'radarr' 'plex-media-server' 'emby-server')
replaces=('plexrequests' 'ombi-beta')
provides=('ombi')
conflicts=('ombi')
options=('staticlibs')
backup=('opt/Ombi/Ombi.sqlite')
install='ombi.install'
noextract=("${pkgname}.tar.gz")
source=("${pkgname}.tar.gz::https://ci.appveyor.com/api/projects/tidusjar/requestplex/artifacts/linux.tar.gz"
        'ombi.service'
        'ombi.sysusers')
sha256sums=('c29353ff9b608a869a286190ba4c7f28fb51623e9998ee62ca715f5cacdae09a'
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
