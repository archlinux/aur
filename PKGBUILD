# Maintainer: Clayton Craft <clayton@craftyguy.net>
pkgname=terminate
pkgver=0.3.3
pkgrel=1
pkgdesc="Minimal terminal emulator based on VTE"
arch=("x86_64")
url="https://git.sr.ht/~craftyguy/terminate"
license=("GPL3")
depends=("vte3" "vte-common")
makedepends=("gcc" "meson" "ninja" "scdoc")
provides=("${pkgname}")
backup=("etc/terminate/config")
source=("https://git.sr.ht/~craftyguy/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('dea9a3c7d6f7ef105052d9cc60bfc71594bba9c1630efad5fa8b5b8a560d6ecf6aabcd4c5c8d05e9717b032e5754db38118bc578a61e2f14ea146e9c1768105e')

build() {
        cd "${srcdir}/${pkgname}-${pkgver}"
        meson --prefix="${pkgdir}/usr" builddir
        ninja -C builddir
}

package() {
        cd "${srcdir}/${pkgname}-${pkgver}"
        ninja -C builddir install
        install -Dm644 config "${pkgdir}/etc/${pkgname}/config"
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
        install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
