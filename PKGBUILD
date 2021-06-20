# Maintainer: MithicSpirit <rpc01234 at gmail dot com>
# Contributor: SuchBlue
pkgname=salad
pkgver=0.5.5
pkgrel=1
epoch=
pkgdesc="Salad allows gamers to mine crypto in their downtime."
arch=(x86_64)
url="https://salad.com/"
license=('MIT')
groups=()
depends=(nodejs npm)
makedepends=(unzip wget sed tar)
checkdepends=()
optdepends=()
provides=(salad)
conflicts=(salad)
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/SaladTechnologies/salad-applications/archive/refs/tags/${pkgver}.zip")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "salad-applications-${pkgver}/packages/desktop-app"
	sed -i 's/: "electron-builder/: "electron-builder --linux pacman/g' package.json	
}

build() {
	cd "salad-applications-${pkgver}/packages/desktop-app"	
	npm install --force
	npm run lint
	npm run build-app
	npm run build-installer
}

package() {
	cd "salad-applications-${pkgver}/packages/desktop-app/dist/app"
	tar xf "Salad-${pkgver}.pacman" --directory="${pkgdir}"
	rm "${pkgdir}/.MTREE"
	rm "${pkgdir}/.INSTALL"
	rm "${pkgdir}/.PKGINFO"
	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/opt/Salad/salad" "${pkgdir}/usr/bin/salad"
}
