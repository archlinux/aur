# Maintainer: SuchBlue
pkgname=salad-git
pkgver=0.5.2
pkgrel=1
epoch=
pkgdesc="Salad allows gamers to mine crypto in their downtime. We turn your GPU power into credits you can spend on items like subscriptions, games, gift cards, and more from our curated storefront."
arch=(x86_64)
url=""
license=('MIT')
groups=()
depends=(nodejs npm)
makedepends=(unzip wget sudo sed)
checkdepends=()
optdepends=()
provides=(salad)
conflicts=(salad)
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/SaladTechnologies/salad-applications/archive/refs/tags/0.5.2.zip")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "salad-applications-0.5.2/packages/desktop-app"
	sed -i 's/: "electron-builder/: "electron-builder -l pacman/g' package.json	
}

build() {
	cd "salad-applications-0.5.2/packages/desktop-app"	
	npm install --force
	npm install cliui
	npm run lint
	npm run build-app
	npm run build-installer
}

package() {
#	cd "salad-applications-0.5.2/packages/desktop-app"
	cd "salad-applications-0.5.2/packages/desktop-app/dist/app"
	sudo pacman -U Salad-0.5.2.pacman
}
