# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Abir-Tx <abirtx@yandex.com>
pkgname=ffmpeg-coder
pkgver=2.0.0
pkgrel=1.1
epoch=
pkgdesc="A small cross platform CLI tool which will help in producing different types video converting codes quickly for new ffmpeg CLI users"
arch=(x86_64 i686)
url="https://github.com/Abir-Tx/ffmpeg-coder.git"
license=('MIT')
groups=()
depends=()
makedepends=(git make gcc)
optdepends=(ffmpeg)
provides=(ffmpeg-coder)
conflicts=(ffmpeg-coder)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "$pkgname"
	git switch pkgbuild
	mkdir build && cd build
	cmake ..
}

build() {
	cd "$pkgname"
	cd build
	make
}

package() {
	cd "$pkgname"
	cd build
	sudo make install
	cd ..
	install -Dm644 docs/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
