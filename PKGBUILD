# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=sonarrannounced-git
pkgver=r110.57c6c87
pkgrel=3
pkgdesc="Manage and download subtitles for Sonarr and Radarr."
arch=('any')
url="https://github.com/l3uddz/sonarrAnnounced"
license=('GPL3')
depends=('python'
         'python-flask'
         'python-flask-httpauth'
         'python-pluginbase'
         'python-pony'
         'python-profig'
         'python-pydle'
         'python-requests'
         'python-tornado'
         'python-unidecode'
         'python-pythreadworker')

makedepends=('git')
source=("git+https://github.com/l3uddz/sonarrAnnounced"
        'sonarrannounced.service'
        'sonarrannounced.sysusers'
        'sonarrannounced.tmpfiles')

sha256sums=('SKIP'
            'b0240129fa590be69c64d79f96abc769c09d8bdedce18d7ad6b6e8f68e6eef0f'
            'ad0f35e5e97f8d9dcb61ff1036e8cd7eed40b41eba4226f4fd882bc194905e53'
            'a4f91723507f1c356282b26558096994f3d4e2a5d49a012e0441fc4d7ea60aff')

pkgver() {
  cd "sonarrAnnounced"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d -m 755 "${pkgdir}/usr/lib/sonarrannounced"

  # Remove .git folder.
  #rm -rf "${srcdir}/sonarrAnnounced/.git"

  # Remove unneeded systemd service file
  rm -rf "${srcdir}/sonarrAnnounced/systemd"


  cp -dpr --no-preserve=ownership "${srcdir}/sonarrAnnounced/"* "${pkgdir}/usr/lib/sonarrannounced"

  install -D -m 644 "${srcdir}/sonarrannounced.service" "${pkgdir}/usr/lib/systemd/system/sonarrannounced.service"
  install -D -m 644 "${srcdir}/sonarrannounced.sysusers" "${pkgdir}/usr/lib/sysusers.d/sonarrannounced.conf"
  install -D -m 644 "${srcdir}/sonarrannounced.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/sonarrannounced.conf"
}
