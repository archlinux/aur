# Maintainer: Nikola Hadžić <nikola@firemail.cc>
pkgname="nixwriter"
pkgver=0.1
pkgrel=2
epoch=
pkgdesc="Create bootable Linux images with dd and from a GTK user interface"
arch=("x86_64")
url="https://gitlab.com/9898287/nixwriter"
license=("MIT")
groups=()
depends=("gtk3" "polkit" "util-linux") 
makedepends=("ldc" "dub")
checkdepends=()
optdepends=("libnotify: notifications")
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("git+https://gitlab.com/9898287/nixwriter.git")
noextract=("git+https://gitlab.com/9898287/nixwriter.git")
sha256sums=("SKIP")

prepare() {
	cd "$srcdir/$pkgname"
	git reset --hard "81cde3891ca62e2086785448b892e5a8d28830d9"
}

build() {
	cd "$srcdir/$pkgname"
	dub build -b release -defaultlib --compiler ldc
}

package() {
	cd "$srcdir/$pkgname"
	mkdir -vp "$pkgdir/usr/bin/"
	mkdir -vp "$pkgdir/usr/share/icons/hicolor/48x48/apps/"
	mkdir -vp "$pkgdir/usr/share/applications/"

	cp -v "bin/$pkgname" "$pkgdir/usr/bin/"
	cp -v "resources/nixwriter.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/"
	cp -v "resources/nixwriter.desktop" "$pkgdir/usr/share/applications/"
}

