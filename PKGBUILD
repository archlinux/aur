# Maintainer: Kilian Guillaume "cafehaine" <kilian dot guillaume at gmail dot com>
pkgname='nymphcast-player-git'
_reponame=NymphCast
pkgver=131
pkgrel=1
pkgdesc="Audio and video casting system with support for custom applications."
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/MayaPosch/NymphCast"
license=('BSD-3-Clause')
depends=('nymphrpc' 'nymphcast-sdk' 'qt5-base')
makedepends=('git')
source=("git+https://github.com/MayaPosch/NymphCast.git")
md5sums=('SKIP')
provides=('nymphcast-player')

pkgver() {
  cd ${srcdir}/${_reponame}
  git rev-list --count HEAD
}

build() {
	cd ${srcdir}/${_reponame}
	cd player/NymphCastPlayer
	mkdir build
	cd build
	qmake ..
	make
}

package() {
	cd ${srcdir}/${_reponame}
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 player/NymphCastPlayer/build/NymphCastPlayer "$pkgdir/usr/bin/NymphCastPlayer"
}
