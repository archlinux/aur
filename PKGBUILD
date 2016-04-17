# Maintainer: Petitsurume <surume at gakupuro dot com>
pkgname=misq-git
pkgver=r114.69432f3
pkgrel=1
pkgdesc="A Unofficial Misskey Client"
arch=('any')
url="https://github.com/Petitsurume/Misq"
license=('MIT')
depends=('python2' 'wxpython' 'python2-requests' 'python2-pillow' 'python2-websocket-client')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Petitsurume/misq')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	mkdir $pkgdir/usr/share/licenses -p
	mkdir $pkgdir/usr/share/misq -p
	mkdir $pkgdir/usr/bin -p
	cat <<'EOF' > $pkgdir/usr/bin/misq
#!/bin/sh
cd /usr/share/misq/
./misq
EOF
	chmod a+x $pkgdir/usr/bin/misq
	cp ./* $pkgdir/usr/share/misq -rf
	cp ./LICENSE $pkgdir/usr/share/licenses/misq-git
}
