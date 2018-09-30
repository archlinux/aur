# Maintainer: Eddy <e.pedroni91 at gmail>
# Contributor: Shanto <shanto at hotmail>
# Contributor: Jesus Jerez <jhuss@archlinux.org.ve>

pkgname=eclipse-platform
pkgver=4.9
_pkgbuild=201809060745
pkgrel=1
pkgdesc="A minimal installation suitable for complete per-user customization with the built-in Eclipse package manager"
url="https://www.eclipse.org"
arch=("i686" "x86_64")
license=("EPL")
depends=("java-environment>=8" "unzip" "webkit2gtk")
optdepends=()
conflicts=("eclipse")
provides=("eclipse=$pkgver")
options=(!strip)

source=(
    "http://www.eclipse.org/downloads/download.php?file=/eclipse/downloads/drops4/R-${pkgver}-${_pkgbuild}/eclipse-platform-${pkgver}-linux-gtk.tar.gz&r=1"
    "eclipse.sh"
    "eclipse.desktop"
)

sha512sums=(
    "758bc0de30fa5c4b76b343ea0325611d87b6928ef5002244f2f1ba2a9fa937de89b2a94ce2c8d33d79344fd574d6e8a72c5d127fe416d785f48600e9e85fce86"
    "71393b01c2774654e1b3348ceedd6b110c7f1b26da93da40dac653ce2103a34997ec0e9e7fd4e977d869c149d19ef39f59738717cc6762e39b0bc0e7d53df4ac"
    "acd327bd68b81185f6ab232d89dad2771300e6b7f404c881a46998188a35337164502896c0a7c666abb5b79183b30f1b533883cc37fafccd84ebdaedf0b5af9c"
)

if [ "$CARCH" = "x86_64" ]; then
    source[0]=${source/linux-gtk/linux-gtk-x86_64}
    sha512sums[0]="875714bb411145c917fccedf2f7c4fd2757640b2debf4a18f775604233abd6f0da893b350cc03da44413d7ec6fae3f773ef08634e632058e4b705e6cda2893eb"
fi

package() {
    install -d ${pkgdir}/usr/bin ${pkgdir}/usr/lib ${pkgdir}/usr/share/applications
    
    install -m755 "${srcdir}/eclipse.sh" "${pkgdir}/usr/bin/eclipse"
    install -Dm644 "${srcdir}/eclipse.desktop" "${pkgdir}/usr/share/applications/"
    
    for _i in 16 32 48 256; do
        install -Dm644 "${srcdir}"/eclipse/plugins/org.eclipse.platform_*/eclipse${_i}.png "$pkgdir/usr/share/icons/hicolor/${_i}x${_i}/apps/eclipse.png"
    done
    
    mv "${srcdir}/eclipse" "${pkgdir}/usr/lib/"
}
