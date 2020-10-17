# Maintainer: Arti Zirk <arti.zirk@gmail.com>
# Contributor: Timmy Yao <timmy.yao+aur@gmail.com>
pkgname=authy-desktop-win32-bin
pkgver=1.8.3
pkgrel=3
pkgdesc="Two-Factor Authentication from your PC. Converted from Windows electron version"
arch=("x86_64")
provides=('authy')
conflicts=('authy')
url="https://authy.com/"
license=('unknown')
depends=('electron9')
makedepends=('npm' 'p7zip' 'asar')
source=("https://s3.amazonaws.com/authy-electron-repository-production/authy/stable/${pkgver}/win32/x64/Authy%20Desktop%20Setup%20${pkgver}.exe"
        "authy.desktop")
md5sums=('630362cf725391d1fc86c9a4d06f0161'
         'f02a27fe07bf9924c462838a6340d14d')

build() {
	cd "$srcdir"
	7z x "Authy%20Desktop%20Setup%20${pkgver}.exe" -o"$pkgname-$pkgver" -y
	
	cd "$pkgname-$pkgver"
	7z x "authy-$pkgver-full.nupkg" -y

	mkdir app.asar
	asar e lib/net45/resources/app.asar app.asar
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm644  -t "${pkgdir}"/usr/lib/authy \
		lib/net45/resources/app.asar \
		app.asar/img/logos/icon128.png
	install -Dm644 "$srcdir"/authy.desktop -t "$pkgdir"/usr/share/applications
}

