# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Ben Curtis <nospam@nowsci.com>

pkgname=gnome-shell-extension-wintile
pkgver=10.1
pkgrel=1
pkgdesc="Windows 10 window tiling for GNOME"
arch=('any')
url="https://github.com/fmstrat/wintile"
license=('GPL3')
depends=('gnome-shell')
makedepends=('zip')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
_srcname=wintile
b2sums=('ff780ee1cc11908664c62d76edced4cfebcb68dc2cda7b2f3cd03b40045b58ee3101158d620e8d765485da61c91818778099b341b6991969e2165ba838cf77f1')

build() {
	cd "$_srcname-$pkgver"
	./build.sh
}

package() {
	cd "$_srcname-$pkgver"
	cd "$(dirname $(find -name 'metadata.json' -print -quit))"
	_extname=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
	_destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_extname}"
	install -d "$pkgdir/usr/share/gnome-shell/extensions/$_extname"
	bsdtar -xvf $_extname.zip -C "$pkgdir/usr/share/gnome-shell/extensions/$_extname"
}
