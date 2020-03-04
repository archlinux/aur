# Maintainer: Kilian Guillaume "cafehaine" <kilian dot guillaume at gmail dot com>
pkgname=nymphrpc-git
_pkgname=nymphrpc
_reponame=NymphRPC
pkgver=1
pkgrel=1
pkgdesc="Versatile and fast remote procedure call library."
arch=('x86_64')
url="https://github.com/MayaPosch/NymphRPC"
license=('BSD-3-Clause')
#TODO check the dependencies
depends=()
makedepends=('git' 'poco')
source=("git+https://github.com/MayaPosch/NymphRPC.git")
md5sums=('SKIP')
provides=('nymphrpc')

pkgver() {
  cd ${srcdir}/${_reponame}
  git rev-list --count HEAD
}

build() {
	cd ${srcdir}/${_reponame}
	make lib
}

package() {
	cd ${srcdir}/${_reponame}
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	install -Dm644 lib/libnymphrpc.a "$pkgdir/usr/lib/libnymphrpc.a"
	install -d "$pkgdir/usr/local/include/nymph"
	install -Dm644 src/*.h "$pkgdir/usr/local/include/nymph"
	#install -Dm644 lib/std/$_realname/*.lua -t "$pkgdir"/usr/lib/lua/5.3/std/$_realname/
}
