# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=qb64-git
pkgver=2.0.2
pkgrel=1
pkgdesc='BASIC for the modern era'
arch=('x86_64')
url='https://www.qb64.org/'
license=('custom')
makedepends=('gcc' 'zlib' 'xorg-xmessage')
provides=('qb64')
conflicts=('qb64')
options=('!strip')
install=qb64.install
source=("git+https://github.com/QB64Team/qb64.git")
sha256sums=('SKIP')

prepare() {
	cd "qb64"
	sed -i 's!~/.local/share/applications/!!' setup_lnx.sh
	sed -i 's!$_pwd!/opt/qb64!' setup_lnx.sh
	sed -i 's!  ./qb64 &!  #./qb64 &!' setup_lnx.sh
}

build() {
	cd "qb64"
	./setup_lnx.sh
}

package() {
	cd "qb64"
	mkdir -p "$pkgdir/opt/qb64"
	cp -r internal licenses COPYING.txt qb64 qb64.1 run_qb64.sh "$pkgdir/opt/qb64"
	chmod -R g+w "$pkgdir/opt/qb64/internal"
	install -Dm644 qb64.desktop "$pkgdir/usr/share/applications/qb64.desktop"
	install -Dm644 COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
