# Maintainer: ninni <soelder@hotmail.com>
pkgname=awakened-poe-trade-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=v2.13.1.r1.fc69988
pkgrel=1
pkgdesc='Path of Exile trading app for price checking'
arch=('any')
url='https://github.com/SnosMe/awakened-poe-trade'
license=('MIT')
depends=()
makedepends=('git' 'yarn') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname}")
conflicts=("${pkgname}")
options=(!strip)
source=('git+https://github.com/SnosMe/awakened-poe-trade.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/awakened-poe-trade"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/awakened-poe-trade"
	yarn
	yarn electron:build
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	cd "$srcdir/awakened-poe-trade/dist_electron/"
	cp *.AppImage "$pkgdir/usr/bin/awakened-poe-trade"
}
