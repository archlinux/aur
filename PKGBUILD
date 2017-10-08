# Maintainer: Rowan Decker <rdecker@scu.edu>
# Contributor: Donald Webster <fryfrog@gmail.com>
# Contributor: Zack Baldwin <zack@zackb.com>

pkgname=ombi-beta
pkgver=23f0ef3b0da4eb0aa1723d877ea8606290b24c8e
pkgrel=1
_branch="DotNetCore"
pkgdesc="Ombi v3.0 Open Beta. Gives Plex or Emby users the ability to request content by themselves"
arch=('any')
url="https://www.ombi.io"
license=('GPL2')
optdepends=('sonarr' 'radarr' 'plex-media-server' 'emby-server')
replaces=('plexrequests')
provides=('ombi')
conflicts=('ombi')
options=('staticlibs')
backup=('opt/ombi/Ombi.sqlite')
install='ombi.install'
noextract=("${pkgname}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::https://ci.appveyor.com/api/projects/tidusjar/requestplex/artifacts/linux.tar.gz?branch=${_branch}"
        "ombi.service"
        "ombi.sysusers")
sha256sums=('SKIP'
            '5f2eae8da2cf938eb7d0014bf7acfe7727eb9df3aa04b96469bcaed753ef9843'
            '27704e4b5c5d944b774bf4d180684ff76f157d37ba9c5e39f7d03493962c81c6')

pkgver() {
  git ls-remote "https://github.com/tidusjar/Ombi.git" | awk "/${_branch}/ {print \$1}"
}

package() {
  install -d "${pkgdir}/opt/ombi"
  tar xf "${pkgname}-${pkgver}.tar.gz" -C "${pkgdir}/opt/ombi"
  chmod -R +r "${pkgdir}/opt/ombi"
  chmod +x "${pkgdir}/opt/ombi/Ombi"
  #install -Dm644 "Release/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/ombi.service" "${pkgdir}/usr/lib/systemd/system/ombi.service"
  install -Dm644 "${srcdir}/ombi.sysusers" "${pkgdir}/usr/lib/sysusers.d/ombi.conf"
}

# vim:set ts=2 sw=2 et:
