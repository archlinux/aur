# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=caido-desktop
pkgver=0.26.0
_commit=3878f913
pkgrel=1
epoch=
pkgdesc="A lightweight web security auditing toolkit."
arch=(x86_64)
url="https://caido.io/"
license=('private')
groups=()
depends=(glibc gcc-libs cairo glib2 hicolor-icon-theme dbus gtk3 gdk-pixbuf2 webkit2gtk pango)
makedepends=()
checkdepends=()
optdepends=()
provides=(caido caido-backend)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://storage.googleapis.com/caido-releases/v${pkgver}/caido-desktop-linux-v${pkgver}-${_commit}.AppImage")
noextract=()
sha256sums=('3878f91360bbb97eac26684b2b971f25c38d835b2cf8bc6ed5f126a8eeda317e')
validpgpkeys=()

prepare() {
	chmod +x *.AppImage
	./*.AppImage --appimage-extract
	mv squashfs-root/* ./
	rm -vrf ./usr/{lib,share/glib-2.0}
}

package() {
	cp -av usr $pkgdir/
	# fix https://bugs.webkit.org/show_bug.cgi?id=256663
	sed -i "s/Exec=caido/Exec=JSC_useDFGJIT=0 caido/" $pkgdir/usr/share/applications/*.desktop
}
