# Maintainer: Kilian Guillaume "cafehaine" <kilian dot guillaume at gmail dot com>
pkgname='nymphcast-sdk-git'
_reponame=NymphCast
pkgver=131
pkgrel=1
pkgdesc="Audio and video casting system with support for custom applications."
arch=('any')
url="https://github.com/MayaPosch/NymphCast"
license=('BSD-3-Clause')
depends=()
makedepends=('git')
source=("git+https://github.com/MayaPosch/NymphCast.git")
md5sums=('SKIP')
provides=('nymphcast-sdk')

pkgver() {
  cd ${srcdir}/${_reponame}
  git rev-list --count HEAD
}

build() {
	cd ${srcdir}/${_reponame}
	cd src/client_lib
	make lib
}

package() {
	cd ${srcdir}/${_reponame}
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 src/client_lib/lib/libnymphcast.a "$pkgdir/usr/lib/libnymphcast.a"
	install -Dm644 src/client_lib/nymphcast_client.h "$pkgdir/usr/include/nymphcast_client.h"
}
