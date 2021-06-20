# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Ben Curtis <nospam@nowsci.com>

pkgname=gnome-shell-extension-wintile
pkgver=7
pkgrel=1
pkgdesc="Windows 10 window tiling for GNOME"
arch=('any')
url="https://github.com/fmstrat/wintile"
license=('GPL3')
depends=('gnome-shell')
makedepends=('zip')
provides=("${pkgname}-git")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
_srcname=wintile
sha512sums=('SKIP')

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