# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname='chia-git'
pkgver=b17.20201101
pkgrel=1
pkgdesc="A new blockchain and smart transaction platform that is easier to use, more efficient, and secure."
arch=('x86_64' 'i686' 'pentium4' 'armv6h' 'armv7h' 'aarch64')
url="https://www.chia.net/"
license=('Apache')
depends=('git' 'python' 'npm' 'nodejs')
makedepends=('bc' 'lsb-release')
source=("git+https://github.com/Chia-Network/chia-blockchain.git"
        "chia-gui.desktop"
        "chia-gui.sh")
sha256sums=('SKIP'
            '28e933f5196aaac8b847467392c1c2e43281a0767113b51d97ab6faaaccb42c7'
            'd1081ad8ccc9c8f1a88b91a64655f459de10fa9adbc5d7dd4c19ce79de8299b8')

build() {
	cd chia-blockchain 
	sh install.sh
	. ./activate
	sh install-gui.sh
}

package() {
	install -Dm644 chia-blockchain/electron-react/src/assets/img/circle-cropped.png "$pkgdir"/usr/share/pixmaps/chia.png
	mkdir -p "$pkgdir"/opt
	mv chia-blockchain "$pkgdir"/opt
	install -Dm755 chia-gui.sh "$pkgdir"/usr/bin/chia-gui
}
