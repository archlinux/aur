# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: LiveEmily <emily@liveemily.com>
pkgname=nextpad-git
pkgver=0.0.r8.5440ee1
pkgrel=1
epoch=
pkgdesc="Not so powerful text editor I'm working on, inspired by vim and nano."
arch=(x86_64)
url="https://github.com/LiveEmily/nextpad.git"
license=('GPL')
groups=()
depends=()
makedepends=(git gcc)
checkdepends=()
optdepends=()
provides=(nextpad)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "${_pkgname}"
	printf "0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd nextpad
	make
}

package() {
	cd nextpad
	mkdir -p ${pkgdir}/opt/${pkgname}
	cp -rf * ${pkgdir}/opt/${pkgname}
	make PREFIX=/usr DESTDIR="${pkgdir}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
