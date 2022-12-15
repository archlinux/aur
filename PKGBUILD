# Maintainer: Arti Zirk <arti.zirk@gmail.com>
# Contributor: Timmy Yao <timmy.yao+aur@gmail.com>
pkgname=authy-desktop-win32-bin
pkgver=2.2.2
pkgrel=1
pkgdesc="Two-Factor Authentication from your PC. Converted from Windows electron version"
arch=("x86_64")
provides=('authy')
conflicts=('authy')
url="https://authy.com/"
license=('unknown')
depends=('electron')
makedepends=('npm' 'unzip' 'asar')
source=("https://pkg.authy.com/authy/stable/${pkgver}/win32/x64/authy-${pkgver}-full.nupkg"
        "authy.desktop")
sha1sums=('7f610d78d0ab19e773baecfff3a648f5698d5566'
          'ad25b45eba0fe935dedfb008f08b005f3bc2504f')

build() {
	cd "$srcdir"

	unzip -o -j "authy-$pkgver-full.nupkg" lib/net45/resources/app.asar
	asar extract-file lib/net45/resources/app.asar img/logos/icon128.png
}

package() {
	cd "$srcdir"

	install -Dm644  -t "${pkgdir}"/usr/lib/authy app.asar icon128.png
	install -Dm644 "$srcdir"/authy.desktop -t "$pkgdir"/usr/share/applications
}

