# Maintainer: Filip Szczepański <jazz2rulez@gmail.com>
pkgname=jwlink-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=v2.0.r1.cb7df12
pkgrel=1
pkgdesc="jwlink is a fork of the open watcom linker wlink"
arch=("x86_64")
url="https://github.com/Baron-von-Riedesel/jwlink"
license=('Watcom-1.0')
depends=('glibc')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Baron-von-Riedesel/jwlink.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make -f GccUnix.mak
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 build/jwlinkLR/jwlink -t "${pkgdir}/usr/bin"
	install -Dm644 \
		README.md html/JWlink.html \
		Ver/{History.txt,jwlink.lnk,Readme.html,Readme.txt} \
		-t "${pkgdir}/usr/share/doc/${pkgname}"
	install -Dm644 Ver/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
