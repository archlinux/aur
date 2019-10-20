# Maintainer: dakriy <aur at persignum dot com>
pkgname=classicube-git
_pkgname=ClassiCube
pkgver=1.0.8.r68.g88af4d7c
pkgrel=1
epoch=0
pkgdesc="Game based on the original Minecraft Classic. (Not an official package)"
arch=('x86_64')
url="https://www.classicube.net/"
license=('custom')
depends=('openal' 'mesa' 'curl')
makedepends=('git')
provides=('classicube')
conflicts=('classicube')
source=("git://github.com/UnknownShadow200/ClassiCube.git")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname/src"
	make
	echo -e "#!/bin/bash\nmkdir -p \$HOME/.cache/classicube\n/usr/bin/classicube_run -d\$HOME/.cache/classicube" > classicube
	chmod +x classicube
}

package() {
	install -D "$srcdir/$_pkgname/src/ClassiCube" "$pkgdir/usr/bin/classicube_run"
	install -D "$srcdir/$_pkgname/src/classicube" "$pkgdir/usr/bin/classicube"
	mkdir -p $pkgdir/usr/share/licenses/$pkgname
	install -D "$srcdir/$_pkgname/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}

