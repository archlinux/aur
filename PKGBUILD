# Maintainer: Clayton Craft <clayton@craftyguy.net>
pkgname=terminate
pkgver=0.2.1
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
sha512sums=('7ca869ece070641abd95f6e6c1f4e50f05335c006ada33fe6572e326ad785fc9211f2f9a669878000fe6b1f2dada00ad377fa76880854d07141102ac333bb195')

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
