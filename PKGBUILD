# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kicker0429 <kicker0429@yahoo.com>
# Contributor: katt <magunasu.b97@gmail.com>

pkgname=libopenaptx-git
_pkgname="${pkgname%-git}"
pkgver=0.2.1.r0.g811bc18
pkgrel=1
pkgdesc='Open Source implementation of Audio Processing Technology codec (aptX)'
arch=('x86_64')
url='https://github.com/pali/libopenaptx'
license=('GPL3')
depends=('glibc')
makedepends=('git')
provides=("$_pkgname.so")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$_pkgname" describe --long --tags | sed 's/-/.r/;s/-/./'
}

build() {
	cd "$_pkgname"
	make CFLAGS="-O2 $CFLAGS" LDFLAGS="$LDFLAGS"
}

package() {
	cd "$_pkgname"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
