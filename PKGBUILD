# Maintainer: Christian Pinedo <christian (at) chrpinedo (dot) me>
# Co-Maintainer: Mark Wagie <mark (dot) wagie (at) tutanota (dot) com>
pkgname=solarwallet-appimage
_pkgname=solarwallet
_githubname=solar
pkgver=0.25.2
pkgrel=1
pkgdesc="Wallet for the Stellar payment network by SatoshiPay (AppImage)"
arch=('x86_64')
url='https://solarwallet.io/'
license=('MIT')
makedepends=('npm')
provides=('solarwallet')
conflicts=('solarwallet')
options=(!strip)
source=("https://github.com/satoshipay/$_githubname/archive/v$pkgver.tar.gz"
	"$pkgname.sh"
	"$pkgname.desktop")
md5sums=('dbbbf8d23142c3d2208ade218af235c8'
         '9065522af7470ea8274db63226ff189a'
         '997ffe13c2bed2205ac343a631fb2d21')

build() {
	cd "$srcdir/$_githubname-$pkgver"
	npm install --cache "$srcdir/npm-cache"
	npm run build:linux
}

package() {
	cd "$srcdir/$_githubname-$pkgver"
	install -Dm755 "electron/dist/Solar-Wallet-$pkgver.AppImage" "$pkgdir/opt/appimages/$_pkgname.AppImage"
	install -Dm644 electron/build/icons/512.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
	cd "$srcdir"
	install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
