# Maintainer: Clayton Craft <clayton@craftyguy.net>
pkgname=terminate
pkgver=0.2.2
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
sha512sums=('a10961defc1ee31772b2ded64069b1f40b4faae5c7b0c381b23aa32ea82990399d2fa1498ee7a15336370618c51be1e561336003ebf122bc24c5baaad6df3dcf')

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
