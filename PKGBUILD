# Maintainer: Matt Coffin <mcoffin13@gmail.com>
pkgname=flysight-viewer-qt-git
pkgver=r540.131f465
pkgrel=1
pkgdesc="Viewer application for flysight GPS log data"
arch=('i686' 'x86_64')
url="https://github.com/flysight/flysight-viewer-qt"
license=('unknown')
groups=()
depends=('qt5-base' 'qt5-webkit' 'wwwidgets' 'libvlc-qt')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://github.com/flysight/flysight-viewer-qt#branch=master" '0002-Fix-libvlc-qt-library-naming.patch')
noextract=()
md5sums=('SKIP' 'SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
    patch -p1 -i "$srcdir/0002-Fix-libvlc-qt-library-naming.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}/src"
    qmake
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
}

package() {
	cd "$srcdir/${pkgname%-git}/src"
    mkdir -p "$pkgdir/usr/bin"
    install -m 0755 -t "$pkgdir/usr/bin" ./FlySightViewer
}
