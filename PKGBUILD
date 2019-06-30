# Maintainer: Nick Cao <nickcao@nichi.co>
pkgname=cleardns-git
pkgver=1.0.1.r1.g76d3dd4
pkgver() {
  cd cleardns
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=2
pkgdesc='another clean DNS'
arch=('x86_64')
license=('GPLv3')
makedepends=('go' 'git')
source=('git+https://gitlab.com/NickCao/cleardns')
md5sums=('SKIP')
build() {
	cd $srcdir/cleardns
	go build
}
package() {
	install -Dm755 $srcdir/cleardns/cleardns $pkgdir/usr/bin/cleardns
	install -Dm644 $srcdir/cleardns/cleardns.service $pkgdir/usr/lib/systemd/system/cleardns.service
}
