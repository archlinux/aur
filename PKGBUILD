# Maintainer: coolcoala
# Publisher: prettyleaf
pkgname="koala-clash-bin"
pkgver="1.3.1"
pkgrel=2
pkgdesc="A geeked Mihomo client with features which improve the user experience."
arch=("x86_64" "aarch64")
url="https://github.com/coolcoala/koala-clash"
makedepends=("binutils" "tar")
depends=("libxrandr" "libxcb" "mesa" "libxdamage" "libcups"
"dbus" "alsa-lib" "pango" "glibc" "gtk3" "nspr" "gcc-libs"
"cairo" "at-spi2-core" "expat" "libxkbcommon" "glib2" "libxcomposite"
"libxext" "libx11" "nss" "systemd-libs" "libxfixes")
provides=("koala-clash=${pkgver}")
conflicts=('koala-clash' 'koala-clash-git' 'koala-clash-electron-git')
license=("GPL-3.0-only")
source_x86_64=("https://github.com/coolcoala/koala-clash/releases/download/${pkgver}/Koala.Clash_amd64.deb")
sha256sums_x86_64=('0a10838279f1faf2f238da0588d1e53fa4428678d95e5b066d25fa2ceb78971a')
source_aarch64=("https://github.com/coolcoala/koala-clash/releases/download/${pkgver}/Koala.Clash_arm64.deb")
sha256sums_aarch64=('8c3e67b7a00510820e74eed73914c2b10ba40ef4087c64d41372425102c61df9')

prepare() {
        if [ "$CARCH" = "aarch64" ]; then
                ar p Koala.Clash_arm64.deb data.tar.xz | tar --zstd -x
        else
                ar p Koala.Clash_amd64.deb data.tar.xz | tar --zstd -x
        fi
}

package() {
        cd $srcdir
        cp -R usr ${pkgdir}
        cp -R opt ${pkgdir}
        chmod +x ${pkgdir}/opt/Koala.Clash/resources/files/sparkle-service
        chmod +sx ${pkgdir}/opt/Koala.Clash/resources/sidecar/mihomo
        chmod +sx ${pkgdir}/opt/Koala.Clash/resources/sidecar/mihomo-alpha
}