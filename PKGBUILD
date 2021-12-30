# Maintainer: Yarmo Mackenbach <yarmo@yarmo.eu>
pkgname=wowncast
pkgver=0.2.0
pkgrel=3
pkgdesc="Owncast terminal client"
arch=("x86_64" "armv7h" "aarch64")
url="https://codeberg.org/yarmo/$pkgname"
license=("GPL3")

makedepends=("dart")
optdepends=("mpv: for watching streams"
            "vlc: for watching streams")
OPTIONS=(!strip !docs !libtool !staticlibs emptydirs zipman purge !debug)

changelog="CHANGELOG.md"
source=("https://codeberg.org/yarmo/$pkgname/archive/$pkgver.tar.gz")
md5sums=('4e728a4c4c3fd13bcc4a85a4942722ec')

build() {
	cd "${srcdir}/${pkgname}"
	make
}

package() {
	cd "${srcdir}/${pkgname}"

	# Install the binary
	install -D -m755 dist/wowncast "${pkgdir}/usr/bin/${pkgname}"

	# Install the bash autocompletion file
	install -D -m644 assets/wowncast-completion.bash "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
}
