# Maintainer: Louis Dalibard <ontake@ontake.dev>
# Contributor: Louis Dalibard <ontake@ontake.dev>
_pkgbase="ontake-xyosc"
pkgname="$_pkgbase-git"
pkgver=r19.g53cef14
pkgrel=1
pkgdesc="A simple XY-oscilloscope written in Go."
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/make-42/xyosc"
license=('GPL3')
groups=()
depends=('mesa' 'libxi' 'libxcursor' 'libxrandr' 'libxinerama' 'wayland' 'libxkbcommon' 'adobe-source-han-sans-jp-fonts')
makedepends=('go>=1.18' 'git')
optdepends=()
provides=("$_pkgbase")
conflicts=("$_pkgbase")
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/make-42/xyosc")
noextract=()
md5sums=("SKIP") #autofill using updpkgsums

pkgver() {
	cd ${srcdir}/xyosc
	echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/xyosc"
	go mod tidy
	go build -tags noaudio
}
	
package() {
	cd ${srcdir}
	install -Dm755 "xyosc/xyosc" "${pkgdir}"/usr/bin/xyosc
	install -Dm644 "xyosc/icons/assets/icon.svg" "$pkgdir/usr/share/icons/hicolor/symbolic/apps/xyosc.svg"
  	install -Dm644 "../xyosc.desktop" "$pkgdir/usr/share/applications/xyosc.desktop"
}
