# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Thomas Martens <aur@defaultschuldiger.de>
_pkgname=v1541commander
pkgname=v1541commander-nonstatic
pkgver=1.1
pkgrel=1
epoch=
pkgdesc="virtual 1541 disc commander to create and modify d64 images - non static"
arch=('i686' 'x86_64')
url="https://github.com/excess-c64/${_pkgname}"
license=('custom:BSD 2-Clause "Simplified" License')
groups=()
depends=('glibc' 'glib2' 'lib1541img' 'qt5-base' 'gcc-libs' 'libglvnd' 'libpng' 'zlib' 'harfbuzz' 'openssl' 'systemd-libs' 'pcre' 'pcre2' 'double-conversion' 'zstd' 'libx11' 'libxext' 'freetype2' 'graphite' 'xz' 'lz4' 'bzip2' 'libgcrypt' 'libxcb' 'libxau' 'libxdmcp')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=('v1541commander')
replaces=()
backup=()
options=()
install=$_pkgname.install
changelog=
source=("git+https://github.com/excess-c64/${_pkgname}.git#tag=v${pkgver}")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "$_pkgname"
	git submodule update --init
}

build() {
	cd "$_pkgname"
	make -j4 strip
}

package() {
	cd "$_pkgname"
	make prefix="/usr/" DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
