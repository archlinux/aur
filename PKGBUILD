# Maintainer: Carlos Bellino <carlosbellino@gmail>

pkgname=watcher3
_gitname=Watcher3
_gitauthor=nosmokingbandit
pkgver=927.0217e75
pkgrel=1
pkgdesc="Automated movie NZB & Torrent searcher and snatcher"
arch=('any')
url="https://github.com/nosmokingbandit/${_gitname}"
license=('Apache')
depends=('python')

optdepends=("deluge"
            "qbittorrent"
            "rtorrent"
            "sabnzbd"
            "transmission-cli")

makedepends=('git')
install=${pkgname}.install

source=("git://github.com/${_gitauthor}/${_gitname}.git"
        "watcher3.service"
        "watcher3.install")

md5sums=('SKIP'
         '3c3c11ea82d64953917a1b649d1211cb'
         '7eb1be1e1a08716e11d18c3ea7dd5e54')

pkgver() {
  cd ${_gitname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  mkdir -p "${pkgdir}/opt/"
  cp -r "${srcdir}/${_gitname}" "${pkgdir}/opt/${pkgname}"

  install -Dm644 "${srcdir}/watcher3.service" "${pkgdir}/usr/lib/systemd/system/watcher3.service"
}