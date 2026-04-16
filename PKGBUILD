# Maintainer: coolcoala
# Publisher: prettyleaf
pkgname="koala-clash-bin"
pkgver="1.1.1"
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
sha256sums=('35f107f3a442f93baa7f2ee531c0880fee4d96d5a7c818c44ef2fcded22f3768')
source_aarch64=("https://github.com/coolcoala/koala-clash/releases/download/${pkgver}/Koala.Clash_arm64.deb")
sha256sums_aarch64=('f69b4f6adb3f9973aa6027dea7cdaeb4bf9b815e86fe4511b4331373168e7443')

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