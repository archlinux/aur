# Maintainer: Konstantin Pospelov <kupospelov@gmail.com>
pkgname=bare
pkgver=0.4
pkgrel=1
pkgdesc='A lightweight vertical bar for Wayland compositors.'
arch=('x86_64' 'i686')
url='https://github.com/kupospelov/bare'
license=('MIT')
makedepends=('rust' 'make' 'scdoc')
# GCC LTO objects from pipewire-native-spa cannot be linked by Rust's lld.
options=('!debug' '!strip' '!emptydirs' '!lto')
source=("https://github.com/kupospelov/bare/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f08f786d052a88877b4dd904f174985b3b3cf3abf04baa2cd95b32881fb81425')

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
