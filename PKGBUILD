# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=peerflix-git
_gitname=peerflix
pkgver=0.37.0.r0.gf48f7a0
pkgrel=1
pkgdesc="Streaming torrent client for node.js"
arch=('any')
url="https://github.com/mafintosh/peerflix"
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm')
provides=('peerflix')
conflicts=('peerflix')
options=(!emptydirs)
source=('git://github.com/mafintosh/peerflix.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}"

  # Fix error with npm5 issue
  tar -czf peerflix.tar.gz peerflix
}

package() {
  cd "${srcdir}/${_gitname}"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_gitname}"
  npm install --cache ../cache --user root -g --prefix "${pkgdir}/usr" ../*.tar.gz
}

# vim:set ts=2 sw=2 et:
