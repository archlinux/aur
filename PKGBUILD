# Maintainer: Clayton Craft <clayton@craftyguy.net>
pkgname=terminate
pkgver=0.5
pkgrel=0
pkgdesc="Minimal terminal emulator based on VTE"
arch=("x86_64")
url="https://git.sr.ht/~craftyguy/terminate"
license=("GPL3")
depends=("vte3" "vte-common")
makedepends=("gcc" "meson" "ninja" "scdoc")
provides=("${pkgname}")
backup=("etc/terminate/config")
source=("https://git.sr.ht/~craftyguy/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('8d5a320d4ab1d897d3534d7f629e6f36d9fd756fcf23893e6728988f8a09b6b85b3885f1cb495d981542aa64916d33a46d4280e76f1ce6975e86aa88696ddb3d')

build() {
        cd "${srcdir}/${pkgname}-${pkgver}"
        meson --prefix=/usr builddir
        meson compile -C builddir
}

package() {
        cd "${srcdir}/${pkgname}-${pkgver}"
        DESTDIR="$pkgdir" meson install -C builddir

        install -Dm644 config "${pkgdir}/etc/${pkgname}/config"
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
        install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
