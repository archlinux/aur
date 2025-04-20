# Maintainer: kotofyt <bratelllo@gmail.com>
pkgname=god-build-git
pkgver=r23.5cfe849
pkgrel=1
epoch=
pkgdesc="Build system which is capable of building different stuff using C"
arch=('x86_64')
url="https://github.com/KoT3isGood/god"
license=('BSD-3-Clause')
groups=()
depends=('glibc' 'clang' 'binutils' 'gcc')
makedepends=('git')
checkdepends=()
optdepends=('mingw-w64-gcc' 'mingw-w64-binutils')
provides=('god')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/KoT3isGood/god.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "god"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "god"
	make full
}

package() {
	cd "god"
	install -d "$pkgdir/usr/bin"
	install -d "$pkgdir/opt/god"
	install -d "$pkgdir/opt/god/include"
	cp bin/god "$pkgdir/opt/god/god"
	cp bin/libgod.a "$pkgdir/opt/god/libgod.a"
	cp -r bin/include/* "$pkgdir/opt/god/include/"
	ln -s /opt/god/god "$pkgdir/usr/bin/god"
	chmod +x "$pkgdir/opt/god/god"
}
