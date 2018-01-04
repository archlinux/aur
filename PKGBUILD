# Maintainer: Carlos Bellino <carlosbellino@gmail>

pkgname=watcher3
_gitname=Watcher3
_gitauthor=nosmokingbandit
pkgver=744.c28d755
pkgrel=2
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
install=$pkgname.install
source=("git://github.com/${_gitauthor}/${_gitname}.git" "watcher3.service" "watcher3.install")
md5sums=('SKIP' 'dd12df67e981c96571be99f5f22440d9' 'd1d656af2c4b35df54b320eeb0822dff')

pkgver() {
  cd ${_gitname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  mkdir -p "${pkgdir}/opt/"
  cp -r "$srcdir/$_gitname" "${pkgdir}/opt/${pkgname}"

  install -Dm644 "${srcdir}/watcher3.service" "${pkgdir}/usr/lib/systemd/system/watcher3.service"
}
