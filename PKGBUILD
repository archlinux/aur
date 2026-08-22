# Maintainer: Caitlyn Williams <caitlyn dot williams at proton dot me>

pkgname=spplice-cpp-bin
pkgver=0.9.5
pkgrel=1
pkgdesc="Dedicated Portal 2 mod launcher"
arch=('x86_64')
url="https://github.com/p2r3/spplice-cpp"
license=('custom:Spplice-Terms')
makedepends=('imagemagick')
optdepends=('steam: needed to install Portal 2')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('strip' '!libtool' '!staticlibs' '!emptydirs')
noextract=('spplice-cpp-${pkgver}' 'spplice-icon.ico')

source=("spplice-cpp-${pkgver}::${url}/releases/download/v${pkgver}-alpha/SppliceCPP"
	"spplice-icon.ico::https://raw.githubusercontent.com/p2r3/spplice-cpp/refs/tags/v0.9.5-alpha/resources/icon.ico"
	"spplice-cpp.desktop"
	"LICENSE")

prepare() {
	chmod +x "${srcdir}/spplice-cpp-${pkgver}"
	magick convert "${srcdir}/spplice-icon.ico" "${srcdir}/spplice-icon.png"
}

package() {
	install -Dm755 "${srcdir}/spplice-cpp-${pkgver}" "${pkgdir}/usr/bin/spplice-cpp"
	install -Dm755 "${srcdir}/spplice-cpp.desktop" "${pkgdir}/usr/share/applications/spplice-cpp.desktop"
	install -Dm755 "${srcdir}/spplice-icon.png" "${pkgdir}/usr/share/pixmaps/spplice.png"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

sha256sums=('6b3003e73858d26e393b88948c33d567455417028ef9c04fcfc665849b5d615a'
            '49a20bf94b5dbd9dc54b517578fc3f4212a24cdaacdb2098fd7ccfc875d1387a'
            '68a25b1475031a23da41b7aa9f7205924f8c69292b4de777e6422034d732d7c2'
            '9926ee307995864c56df6ca4dde962e25c9f6282fc07ef5d99dda652917876c6')
