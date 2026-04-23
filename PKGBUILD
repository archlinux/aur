# Maintainer: coolcoala
# Publisher: prettyleaf
pkgname="koala-clash-bin"
pkgver="1.2.0"
pkgrel=1
pkgdesc="A geeked Mihomo client with features that improve the user experience."
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
source=("https://github.com/coolcoala/koala-clash/releases/download/${pkgver}/Koala.Clash_amd64.deb")
sha256sums=('5911589403f4f6e7c1b85a36a4dbcdedf8c21f600bfa2f871e6d567525e3b824')
source_aarch64=("https://github.com/coolcoala/koala-clash/releases/download/${pkgver}/Koala.Clash_arm64.deb")
sha256sums_aarch64=('36d669f5fb028cea58a79635a82bdd50cb525e8116377186e1d46c64f1d68f14')

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