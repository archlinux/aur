# Maintainer: RiCON <wiiaboo@gmail.com>
pkgdesc='Plex HTTP Anilist Metadata Agent'
pkgname=plex-anilist-bundle-git
pkgver=r21.ebcb3b9
pkgrel=1
depends=('plex-media-server' 'plex-ass-scanner-git')
arch=('x86_64' 'i686')
url='https://github.com/sachaw/anilist.bundle'
license=('GPL3')
source=(
    "${pkgname}::git+${url}.git"
)
sha512sums=('SKIP')

pkgver () {
  cd "${srcdir}"
    (
     set -o pipefail
     cd $pkgname
     printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
    )
}

package () {
  cd "${srcdir}"

  #https://wiki.archlinux.org/index.php/plex#Plugins
  plex_main_folder="${pkgdir}/var/lib/plex/Plex Media Server"

  plugins_dir="${plex_main_folder}/Plug-ins/AniList.bundle"
  install -d "$plugins_dir"
  cp -r ./${pkgname}/* "$plugins_dir"
}
