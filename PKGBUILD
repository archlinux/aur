# Maintainer: Clayton Craft <clayton@craftyguy.net>
pkgname=terminate
pkgver=0.1
pkgrel=2
pkgdesc="Minimal terminal emulator based on VTE"
arch=("any")
url="https://git.sr.ht/~craftyguy/terminate"
license=("GPL3")
depends=("vte3" "vte-common")
makedepends=("gcc" "meson" "ninja" "scdoc")
provides=("${pkgname}")
backup=("etc/terminate/config")
source=("https://git.sr.ht/~craftyguy/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('7fda2ed7a00ce1568bc6f9625dcf48d8fe897d518ebc52dc3b02a6d35c9f659b1aca9371b2f67c61b54c66e313e3c1b1f8679ce000314e9d9e1a55170de35e3a')

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
