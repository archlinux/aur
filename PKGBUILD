# Maintainer: zapp-brannigan <fuerst.reinje@web.de>

_pkgname=vdoestimator
pkgname="$_pkgname"-git
pkgver=r23.a33ce60
pkgrel=1
pkgdesc="Estimate space savings from dm-vdo virtual device "
url="https://github.com/dm-vdo/vdoestimator"
license=('GPL-2.0')
arch=(x86_64)
makedepends=('git')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
cd "$_pkgname"
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
cd $srcdir/$_pkgname
make lz4
make uds
make vdoestimator
}
package() {
mkdir -p $pkgdir/usr/bin
install -o root -g root -m 0755 $srcdir/$_pkgname/vdoestimator $pkgdir/usr/bin
}
