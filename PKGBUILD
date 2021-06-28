# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Leo <i@setuid0.dev>
pkgname=qbittorrent-enhanced
pkgver=4.3.6.10
pkgrel=1
epoch=
pkgdesc="A bittorrent client powered by C++, Qt5 and the good libtorrent library (Enhanced Edition)"
arch=('x86_64')
url="https://github.com/c0re100/qBittorrent-Enhanced-Edition"
license=('GPL' 'custom')
groups=()
depends=('libtorrent-rasterbar>=1:1.2.12' 'qt5-base')
makedepends=('boost' 'qt5-tools' 'qt5-svg')
checkdepends=()
optdepends=('python: needed for torrent search tab')
provides=('qbittorrent')
conflicts=('qbittorrent')
replaces=()
backup=()
options=()
install=
changelog=
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/c0re100/qBittorrent-Enhanced-Edition/archive/release-$pkgver.tar.gz"
	"COPYING::https://raw.githubusercontent.com/c0re100/qBittorrent-Enhanced-Edition/v4_3_x/COPYING"
)
noextract=()
md5sums=('SKIP' 'SKIP')

build() {
	cd qBittorrent*$pkgver

	# tell qmake not ot break makepkg's debug/!strip options
	export QBT_ADD_CONFIG='nostrip'

	./configure --prefix=/usr CXXFLAGS="-std=c++17"
	make
}

package() {
	cd qBittorrent*$pkgver

	make INSTALL_ROOT="$pkgdir/" install
	install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING

	msg "IMPORTANT NOTICE"
  msg2 "As of 2021 Mar 29, one of the dependency of this package, libtorrent-rasterbar >= 1.2.12"
	msg2 "is not available yet in archlinux/extra."
	msg2 "You may install without checking dependency by 'pacman -Ud {package_name}'"
}
