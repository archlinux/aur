# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Ben Curtis <nospam@nowsci.com>

pkgname=gnome-shell-extension-wintile
pkgver=2023.10.03_1
pkgrel=1
pkgdesc="Windows 10 window tiling for GNOME"
arch=('any')
url="https://github.com/fmstrat/wintile"
license=('GPL3')
depends=('gnome-shell')
makedepends=('zip')
source=("${pkgname}-${pkgver//_/-}.tar.gz::${url}/archive/v${pkgver//_/-}.tar.gz")
_srcname=wintile
b2sums=('5005d5c2669ea3210f245a87d59294b3509e95931cf10da05c4ea6683f00a94774c9be273450f31a935359a3bacf6a5a4b3d62132d004dd162cfc6a36f3454dc')

build() {
	cd "$_srcname-${pkgver//_/-}"
	./build.sh
}

package() {
	cd "$_srcname-${pkgver//_/-}"
	cd "$(dirname $(find -name 'metadata.json' -print -quit))"
	_extname=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
	_destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_extname}"
	install -d "$pkgdir/usr/share/gnome-shell/extensions/$_extname"
	bsdtar -xvf $_extname.zip -C "$pkgdir/usr/share/gnome-shell/extensions/$_extname"
}
