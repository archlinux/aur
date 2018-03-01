# Maintainer: Nicola Hinssen <nicola.hinssen@gmail.com>
# Contributor: Rowan Decker <rdecker@scu.edu>
# Contributor: Donald Webster <fryfrog@gmail.com>
# Contributor: Zack Baldwin <zack@zackb.com>

pkgname=ombi-beta
pkgver=$(curl -s https://ci.appveyor.com/api/projects/tidusjar/requestplex | grep -Pom 1 '"version":"\K[^"]*')
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
noextract=("${pkgname}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::https://ci.appveyor.com/api/projects/tidusjar/requestplex/artifacts/linux.tar.gz?branch=DotNetCore"
        'ombi.service'
        'ombi.sysusers')
sha256sums=('1746d9df25bb20311bc823e9c7ea0347ba7a092cc03f620f8fa7245e912fa134'
            '5f2eae8da2cf938eb7d0014bf7acfe7727eb9df3aa04b96469bcaed753ef9843'
            '27704e4b5c5d944b774bf4d180684ff76f157d37ba9c5e39f7d03493962c81c6')

package() {
  install -dm755 "${pkgdir}/opt/Ombi"
  tar xzf "${pkgname}-${pkgver}.tar.gz" -C "${pkgdir}/opt/Ombi"
  chmod +x "${pkgdir}/opt/Ombi/Ombi"
  install -Dm644 "${srcdir}/ombi.service" "${pkgdir}/usr/lib/systemd/system/ombi.service"
  install -Dm644 "${srcdir}/ombi.sysusers" "${pkgdir}/usr/lib/sysusers.d/ombi.conf"
}
