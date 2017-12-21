# Maintainer: Carlos Bellino <carlosbellino@gmail>

pkgname=watcher3
_gitname=Watcher3
_gitauthor=nosmokingbandit
pkgver=738.913dd83
pkgrel=1
pkgdesc="Automated movie NZB & Torrent searcher and snatcher"
arch=('any')
url="https://github.com/nosmokingbandit/${_gitname}"
license=('Apache')
depends=('python')
optdepends=("deluge: supported torrent client"
            "qbittorrent: supported torrent client"
            "rtorrent: supported torrent client"
            "sabnzbd: supported NZB downloader"
            "transmission-cli: supported torrent client")
makedepends=('git')
source=("git://github.com/${_gitauthor}/${_gitname}.git" "watcher3.service")
md5sums=('SKIP' '5e5d95d5075cbcccd3a09f9f39dffaa2')

pkgver() {
  cd ${_gitname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  mkdir -p "${pkgdir}/opt/"
  cp -r "$srcdir/$_gitname" "${pkgdir}/opt/${pkgname}"

  install -Dm644 "${srcdir}/watcher3.service" "${pkgdir}/usr/lib/systemd/system/watcher3.service"
}
