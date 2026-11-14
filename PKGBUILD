# Maintainer: coolcoala
# Publisher: prettyleaf
pkgname="koala-clash-bin"
pkgver="1.6.1"
pkgrel=1
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
source_x86_64=("${pkgname}-${pkgver}_amd64.deb::${url}/releases/download/${pkgver}/Koala.Clash_amd64.deb")
sha256sums_x86_64=('b01442d7ec444e1b640b3dfd782c87a9d409d012ce20579620986040279297a3')
source_aarch64=("${pkgname}-${pkgver}_arm64.deb::${url}/releases/download/${pkgver}/Koala.Clash_arm64.deb")
sha256sums_aarch64=('d88b26e37fab51db8a0da9be8d909f73d167128ba935910714701caefcf9e838')

prepare() {
        if [ "$CARCH" = "aarch64" ]; then
                ar p ${pkgname}-${pkgver}_arm64.deb data.tar.xz | tar --zstd -x
        else
                ar p ${pkgname}-${pkgver}_amd64.deb data.tar.xz | tar --zstd -x
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