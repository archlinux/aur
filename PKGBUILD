# Maintainer: Robin Boers <robindev2019@outlook.com>
pkgname=cutie-tanks
pkgver=1.5
pkgrel=2
pkgdesc="Shoot 'em all arcade game"
arch=(x86_64)
url="https://github.com/RobinBoers/cutie-tanks"
license=('GPL')
depends=(electron)
makedepends=(git)
checkdepends=()
optdepends=()
provides=(cutie-tanks)
conflicts=(cutie-tanks-git)
source=('git+https://github.com/RobinBoers/cutie-tanks'
		"${pkgname}-${pkgver}.zip::https://github.com/RobinBoers/cutie-tanks/releases/latest/download/release.zip"
		'sh' 
		'cutie-tanks.desktop'
		'icon.png')
md5sums=('SKIP' 'SKIP' '54534a6bd86a0532825ff4ac1a7b85d7' 
'9da57212f37e078330c4abb08d6c991c' 
'4efc439ce7eedf5a4e1c08996b7afc29')
noextract=("$pkgname-$pkgver.zip")

pkgver() {
  	cd cutie-tanks
  	git describe --abbrev=0 --tags | sed 's/^v//;'
}

build() {
	rm -rf release
	mkdir -p release
	bsdtar -xf "$pkgname-$pkgver.zip" -C release
}

package() {
	chmod +x "sh"
	mkdir -p "$pkgdir/opt/$pkgname/"
	mkdir -p "$pkgdir/usr/share/applications/"
	mkdir -p "$pkgdir/usr/bin/"

	chmod 775 release/*
	
	mv release/* "$pkgdir/opt/cutie-tanks/"

	cp ./cutie-tanks.desktop "$pkgdir/usr/share/applications/cutie-tanks.desktop"
	cp ./sh "$pkgdir/usr/bin/cutie-tanks"
	cp ./icon.png "$pkgdir/opt/cutie-tanks/icon.png"
}
