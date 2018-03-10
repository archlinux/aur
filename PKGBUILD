# Maintainer: Jake <aur@ja-ke.tech>
pkgname=blackbox-explorer
_reponame=blackbox-log-viewer-master
pkgver=3.0.0
pkgrel=1
pkgdesc="Cleanflight and Betaflight Blackbox Explorer (NW.js build)"
arch=("x86_64")
url="https://github.com/cleanflight/$_reponame"
license=('GPL3')
makedepends=('yarn')
source=("https://github.com/cleanflight/blackbox-log-viewer/archive/master.zip")
md5sums=(SKIP)
options=(!strip)

build() {
	cd "$_reponame"
	yarn install
	./node_modules/.bin/gulp apps
}

package() {
	cd "$_reponame"
	install -D apps/cleanflight-$pkgname/linux64/cleanflight-$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -d "$pkgdir/opt/cleanflight/cleanflight-blackbox-explorer/"
	cp -r apps/cleanflight-$pkgname/linux64/* "$pkgdir/opt/cleanflight/cleanflight-blackbox-explorer"
	install -d "$pkgdir/usr/bin/"
	ln -s /opt/cleanflight/cleanflight-blackbox-explorer/cleanflight-$pkgname "$pkgdir/usr/bin/$pkgname"
}
