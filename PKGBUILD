# Maintainer: MrJavum <mrjavum [at] gmail [dot] com>

pkgname=lightdm-autologin-greeter-git
pkgver=v1.0.r6.5fb7a66
pkgrel=1
pkgdesc="Autologin greeter for LightDM - nodm successor"
arch=('i686' 'x86_64')
url="https://github.com/spanezz/lightdm-autologin-greeter"
license=('MIT')
depends=('lightdm' 'python-gobject')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/spanezz/${pkgname%-git}.git#branch=master"
        "${pkgname%-git}.install")
sha256sums=('SKIP'
            'dbaacaf4c10b4ea252ad3ab7f20c0fbb961926302228cf737ae8ce4fe9f10d61')
install="${pkgname%-git}.install"

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	install -Dm755 "$srcdir/${pkgname}/bin/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
	install -Dm644 "$srcdir/${pkgname}/share/xgreeters/${pkgname%-git}.desktop" "$pkgdir/usr/share/xgreeters/${pkgname%-git}.desktop"
}