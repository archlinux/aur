# Maintainer: Robin Boers <robindev2019@outlook.com>
pkgname=cutie-tanks-git
pkgver=1.5
pkgrel=2
pkgdesc="Shoot 'em all arcade game (development version)"
arch=(x86_64)
url="https://github.com/RobinBoers/cutie-tanks"
license=('GPL')
depends=(electron)
makedepends=(git npm parcel-bundler)
checkdepends=()
optdepends=()
provides=(cutie-tanks)
conflicts=(cutie-tanks)
source=('git+https://github.com/RobinBoers/cutie-tanks'
		'sh' 
		'cutie-tanks.desktop'
		'icon.png')
md5sums=('SKIP' 
'54534a6bd86a0532825ff4ac1a7b85d7' 
'9da57212f37e078330c4abb08d6c991c' 
'4efc439ce7eedf5a4e1c08996b7afc29')

pkgver() {
  cd cutie-tanks
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd cutie-tanks
	npm install
	npm run build
}

package() {
	chmod +x "sh"
	mkdir -p "$pkgdir/opt/cutie-tanks/"
	mkdir -p "$pkgdir/usr/share/applications/"
	mkdir -p "$pkgdir/usr/bin/"
	
	mv cutie-tanks/dist/* "$pkgdir/opt/cutie-tanks/"

	mv ./cutie-tanks.desktop "$pkgdir/usr/share/applications/cutie-tanks.desktop"
	mv ./sh "$pkgdir/usr/bin/cutie-tanks"
	mv ./icon.png "$pkgdir/opt/cutie-tanks/icon.png"
	mv cutie-tanks/index.js "$pkgdir/opt/cutie-tanks/index.js"
}
