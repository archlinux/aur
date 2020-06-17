# Maintainer: hashworks <mail@hashworks.net>
# Contributor: soloturn@gmail.com
# Contributor: nic96

pkgname=kiwix-desktop-git
_pkgname="${pkgname%-git}"
pkgver=2.0.1.r16.g8430ee8
pkgrel=1
pkgdesc="Offline reader for Web content, especially intended to make Wikipedia available offline"
url="https://github.com/kiwix/kiwix-desktop"
arch=("i686" "x86_64")
license=("GPL3")
depends=("qt5-base" "qt5-webengine" "qt5-svg" "qt5-imageformats" "kiwix-lib")
makedepends=("qt5-tools" "git")
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${_pkgname}::git+${url}")
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${_pkgname}"
	export CFLAGS+=" ${CPPFLAGS}"
	export CXXFLAGS+=" ${CPPFLAGS}"
	qmake PREFIX="/usr"
	make
}

package() {
	cd "$srcdir/${_pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	make INSTALL_ROOT="$pkgdir/" install
}

