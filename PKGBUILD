# Maintainer: Konstantin Pospelov <kupospelov@gmail.com>
pkgname=bare
pkgver=0.1
pkgrel=1
pkgdesc='A lightweight vertical bar for Wayland compositors.'
arch=('x86_64' 'i686')
url='https://github.com/kupospelov/bare'
license=('MIT')
makedepends=('rust' 'make' 'scdoc')
options=('!debug' '!strip' '!emptydirs')
source=("https://github.com/kupospelov/bare/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c58ace41a887146f4b05124f5f79d877f64638f2d506fe8a085aa75c9009c436')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 <(gzip -c "doc/${pkgname}.1") "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
	install -Dm644 <(gzip -c "doc/${pkgname}.5") "${pkgdir}/usr/share/man/man5/${pkgname}.5.gz"
}
