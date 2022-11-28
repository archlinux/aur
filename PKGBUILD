# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Kilian Guillaume "cafehaine" <kilian dot guillaume at gmail dot com>

pkgname=nymphcast-player-git
_reponame=NymphCast
pkgver=0.1.r39.gd77d5bb
pkgrel=1
pkgdesc="Audio and video casting system with support for custom applications."
arch=(x86_64 i686 armv7h aarch64)
url="https://github.com/MayaPosch/NymphCast"
license=(BSD)
depends=(libnymphcast qt5-base)
makedepends=(git)
provides=(nymphcast-player)
conflicts=(nymphcast-player)
source=("git+https://github.com/MayaPosch/NymphCast.git")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_reponame}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${srcdir}/${_reponame}/player/NymphCastPlayer
  qmake
  make
}

package() {
  cd ${srcdir}/${_reponame}
  install -Dm755 player/NymphCastPlayer/NymphCastPlayer -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
