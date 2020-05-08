# Maintainer: Christian Pinedo <christian@chrpinedo.me>
pkgname=solarwallet-appimage
_pkgname=solarwallet
_githubname=solar
pkgver=0.24.0
pkgrel=1
pkgdesc="Simple and Secure Stellar Wallet"
arch=('x86_64')
url='https://solarwallet.io/'
license=('MIT')
makedepends=('npm')
install=solarwallet-appimage.install
provides=('solarwallet')
conflicts=('solarwallet')
options=(!strip)
source=("https://github.com/satoshipay/$_githubname/archive/v$pkgver.tar.gz"
	"$pkgname.sh"
	"$pkgname.desktop")
md5sums=('f247455f323ff48ad2cb7ba67690a862'
         '9065522af7470ea8274db63226ff189a'
         '997ffe13c2bed2205ac343a631fb2d21')

build() {
	cd "$srcdir/$_githubname-$pkgver"
	npm install
	npm run build:linux
}

package() {
	cd "$srcdir"
	install -Dm755 "$_githubname-$pkgver/electron/dist/Solar-Wallet-$pkgver.AppImage" "$pkgdir/opt/appimages/$_pkgname.AppImage"
	install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
