# Maintainer: phiresky <phireskyde+git@gmail.com> 
pkgname=svp
pkgver=4.0.0.81
pkgrel=1
epoch=
pkgdesc="SmoothVideo Project 4 (SVP4)"
arch=('x86_64')
url="https://www.svp-team.com/wiki/SVP:Linux"
license=('custom')
groups=()
depends=(libmediainfo qt5-svg qt5-script vapoursynth libusb xdg-utils)
makedepends=(p7zip qt-installer-framework)
checkdepends=()
optdepends=(
	'mpv-git: needed for mpv vapoursynth support'
	'ocl-icd: for GPU acceleration'
)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.svp-team.com/files/svp4-linux-64.tbz2")
noextract=()
sha1sums=('ba41038c4ac20997d090a6d552c865d039a49108')
validpgpkeys=()

prepare() {
	rm -rf "$srcdir/installer"
	devtool --dump "$srcdir/installer" "$srcdir/svp4-linux-64.run"
	for f in "$srcdir/installer/metadata/"*/*.7z; do
		7z x -o"$srcdir/extracted/" "$f"
	done
}

package() {
	mkdir -p "$pkgdir"/{opt/svp,usr/bin,usr/share/licenses/svp}
	mv "$srcdir/extracted/licenses" "$pkgdir/usr/share/licenses/$pkgname"
	mv "$srcdir/extracted/"* "$pkgdir/opt/$pkgname"
	ln -s "/opt/$pkgname/SVPManager" "$pkgdir/usr/bin/SVPManager"
	chmod -R +rX "$pkgdir/opt/svp" "$pkgdir/usr/share"
}
