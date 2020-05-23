# Maintainer: Kilian Guillaume "cafehaine" <kilian dot guillaume at gmail dot com>
pkgname='nymphcast-server-git'
_reponame=NymphCast
pkgver=128
pkgrel=1
pkgdesc="Audio and video casting system with support for custom applications."
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/MayaPosch/NymphCast"
license=('BSD-3-Clause')
depends=('nymphrpc' 'sdl2_image' 'ffmpeg')
makedepends=('git')
source=("git+https://github.com/MayaPosch/NymphCast.git")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_reponame}
  git rev-list --count HEAD
}

build() {
	cd ${srcdir}/${_reponame}
	cd src/server
	make
}

package() {
	provides=('nymphcast-server')
	cd ${srcdir}/${_reponame}
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -d "$pkgdir/opt/nymphcast"
	install -Dm755 src/server/bin/nymphcast_server "$pkgdir/opt/nymphcast"
	install -Dm644 src/server/*.jpg "$pkgdir/opt/nymphcast"
	install -Dm644 src/server/*.ini "$pkgdir/opt/nymphcast"
	cp -r src/server/apps "$pkgdir/opt/nymphcast"
}

package_nymphcast-sdk-git() {
	provides=('nymphcast-sdk')
	cd ${srcdir}/${_reponame}
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 src/client_lib/lib/libnymphcast.a "$pkgdir/usr/lib"
	install -Dm644 src/client_lib/nymphcast_client.h "$pkgdir/usr/include"
}

package_nymphcast-player-git() {
	provides=('nymphcast-player')
	cd ${srcdir}/${_reponame}
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 player/NymphCastPlayer/build/player "$pkgdir/usr/bin"
}
